package com.nmt.universitysb.controller;

import com.nmt.universitysb.model.Order;
import com.nmt.universitysb.model.TuitionFee;
import com.nmt.universitysb.service.TuitionFeeService;
import com.nmt.universitysb.service.impl.PaypalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import java.util.Date;
import java.util.Optional;

@Controller
public class PaypalController {

    @Autowired
    PaypalService service;
    @Autowired
    private TuitionFeeService tuitionFeeService;

    public static final String SUCCESS_URL = "pay/success";
    public static final String CANCEL_URL = "pay/cancel";

    @GetMapping("/home")
    public String home() {
        return "home";
    }

    @PostMapping("/pay")
    public String payment() {
        int tuitionFeeId = 9;
        TuitionFee tuitionFee = this.tuitionFeeService.findByTuitionFeeId(tuitionFeeId);
        double tuitionfeeTransfer = tuitionFee.getTuitionFee()/24985;
        try {
            Payment payment = service.createPayment(tuitionfeeTransfer, "USD", "paypal",
                    "sale", "Pay tuition fee", "http://localhost:8082/" + CANCEL_URL,
                    "http://localhost:8082/" + SUCCESS_URL + "?tuitionFeeId=" + tuitionFeeId);
            for(Links link:payment.getLinks()) {
                if(link.getRel().equals("approval_url")) {
                    return "redirect:"+link.getHref();
                }
            }

        } catch (PayPalRESTException e) {

            e.printStackTrace();
        }
        return "redirect:/";
    }

    @GetMapping(value = CANCEL_URL)
    public String cancelPay() {
        return "cancel";
    }

    @GetMapping(value = SUCCESS_URL)
    public String successPay(@RequestParam("paymentId") String paymentId,
                             @RequestParam("PayerID") String payerId,
                             @RequestParam("tuitionFeeId") int tuitionFeeId) {
        try {
            Payment payment = service.executePayment(paymentId, payerId);
            System.out.println(payment.toJSON());
            if (payment.getState().equals("approved")) {
                TuitionFee tuitionFee = this.tuitionFeeService.findByTuitionFeeId(tuitionFeeId);
                tuitionFee.setDateCreated(new Date());
                tuitionFee.setDone(true);
                this.tuitionFeeService.save(tuitionFee);
                return "success";
            }
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/";
    }

}

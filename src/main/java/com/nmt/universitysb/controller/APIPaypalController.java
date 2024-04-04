//package com.nmt.universitysb.controller;
//
//import com.nmt.universitysb.service.PaypalService;
//import com.paypal.api.payments.Links;
//import com.paypal.api.payments.Payment;
//import com.paypal.base.rest.PayPalRESTException;
//import com.paypal.base.rest.PayPalResource;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.servlet.view.RedirectView;
//
//@Controller
//@RequiredArgsConstructor
//@Slf4j
//public class APIPaypalController {
//    private final PaypalService paypalService;
//
//    @PostMapping("/payment/create")
//    public RedirectView createPayment(){
//        try{
//            String cancelUrl = "http://localhost:8082/payment/cancel";
//            String successUrl = "http://localhost:8082/payment/success";
//            Payment payment = paypalService.createPayment(
//                    10.0,
//                    "USD",
//                    "paypal",
//                    "sale",
//                    "Payment description",
//                    cancelUrl,
//                    successUrl
//            );
//
//            for(Links links: payment.getLinks()){
//                if(links.getRel().equals("approval_url")){
//                    return new RedirectView(links.getHref());
//                }
//            }
//        }catch (PayPalRESTException e){
//            log.error("Error occurred:: ", e);
//        }
//
//        return new RedirectView("/payment/error");
//    }
//
//    @GetMapping("/payment/success")
//    public String
//}

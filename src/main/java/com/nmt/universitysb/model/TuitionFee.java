package com.nmt.universitysb.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "tuition_fee")
public class TuitionFee implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "tuition_fee")
    private Double tuitionFee;
    @Column(name = "done")
    private Boolean done;
    @Column(name = "date_created")
    private Date dateCreated;
    @JoinColumn(name = "semester_id", referencedColumnName = "id")
    @JsonIgnore
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Semester semesterId;
    @JoinColumn(name = "student_id", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JsonIgnore
    private Student studentId;
}

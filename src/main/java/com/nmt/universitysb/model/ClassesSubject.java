package com.nmt.universitysb.model;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;


@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "classes_subject")
public class ClassesSubject implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "class_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Classes classId;
    @JoinColumn(name = "subject_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Subject subjectId;
}

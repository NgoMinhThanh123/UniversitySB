package com.nmt.universitysb.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.util.Set;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "score")
public class Score implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "semester_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Semester semesterId;
    @JoinColumn(name = "student_subject_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StudentSubject studentSubjectId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "scoreId")
    private Set<ScoreValue> scoreValueSet;
}

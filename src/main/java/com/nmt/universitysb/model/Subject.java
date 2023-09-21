package com.nmt.universitysb.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
@Table(name = "subject")
public class Subject implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private String id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "credit")
    private int credit;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subjectId")
    @JsonIgnore
    private Set<SubjectSemester> subjectSemesterSet;
    @JoinColumn(name = "faculty_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Faculty facultyId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subjectId")
    @JsonIgnore
    private Set<LecturerSubject> lecturerSubjectSet;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subjectId")
    private Set<StudentSubject> studentSubjectSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subjectId")
    @JsonIgnore
    private Set<ClassesSubject> classesSubjectSet;
}

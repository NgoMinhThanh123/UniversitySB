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
@Table(name = "faculty")
public class Faculty implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private String id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "facultyId")
    @JsonIgnore
    private Set<Student> studentSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "facultyId")
    @JsonIgnore
    private Set<Subject> subjectSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "facultyId")
    @JsonIgnore
    private Set<Classes> classesSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "facultyId")
    @JsonIgnore
    private Set<Lecturer> lecturerSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "facultyId")
    @JsonIgnore
    private Set<Major> majorSet;
}

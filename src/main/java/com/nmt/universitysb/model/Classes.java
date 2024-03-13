package com.nmt.universitysb.model;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.io.Serializable;
import java.util.Set;


@Getter
@Setter
@ToString(exclude = {"studentSet"})
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "classes")
public class Classes implements Serializable {
    @Id
    @NotBlank(message = "Id không được để trống")
    @Column(name = "id")
    private String id;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "classesId", fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<Student> studentSet;
    @JoinColumn(name = "faculty_id", referencedColumnName = "id")
    @JsonIgnore
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Faculty facultyId;
    @JsonIgnore
    @OneToMany(mappedBy = "classesId", fetch = FetchType.LAZY)
    private Set<Lecturer> lecturerSet;

}

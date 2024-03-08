package com.nmt.universitysb.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "semester")
public class Semester implements Serializable {
    @Id
    @Basic(optional = false)
    @NotBlank(message = "Id không được để trống")
    @Column(name = "id")
    private String id;
    @NotEmpty(message = "Tên không được để trống")
    @Column(name = "name")
    private String name;
    @Column(name = "school_year")
    private int schoolYear;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "from_date")
    @Temporal(TemporalType.DATE)
    private Date fromDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "to_date")
    @Temporal(TemporalType.DATE)
    private Date toDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "semesterId")
    @JsonIgnore
    private Set<SubjectSemester> subjectSemesterSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "semesterId")
    @JsonIgnore
    private Set<Score> scoreSet;
}

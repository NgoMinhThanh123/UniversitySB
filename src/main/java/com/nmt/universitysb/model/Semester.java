package com.nmt.universitysb.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "semester")
public class Semester implements Serializable {
    @Id
    @Basic(optional = false)
    @NotBlank
    @Column(name = "id")
    private String id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "school_year")
    private int schoolYear;
    @Basic(optional = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "from_date")
    @Temporal(TemporalType.DATE)
    private Date fromDate;
    @Basic(optional = false)
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

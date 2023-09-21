package com.nmt.universitysb.model;

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
@Table(name = "score_value")
public class ScoreValue implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "value")
    private double value;
    @JoinColumn(name = "score_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Score scoreId;
    @JoinColumn(name = "score_column_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private ScoreColumn scoreColumnId;
}

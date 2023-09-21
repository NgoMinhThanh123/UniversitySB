package com.nmt.universitysb.dto;

import com.nmt.universitysb.model.Faculty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LecturerDto {
    private String id;

    private String name;

    private Date birthday;

    private short gender;

    private String phone;

    private String address;

    private Faculty facultyId;

}

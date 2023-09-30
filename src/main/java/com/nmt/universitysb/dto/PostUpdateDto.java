package com.nmt.universitysb.dto;

import com.nmt.universitysb.model.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class PostUpdateDto {
    private String content;
}


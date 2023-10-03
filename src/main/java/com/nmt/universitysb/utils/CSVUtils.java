package com.nmt.universitysb.utils;

import com.nmt.universitysb.dto.StudentScoreDTO;

import java.io.PrintWriter;
import java.util.List;

public class CSVUtils {
    public void exportToCSV(List<StudentScoreDTO> studentScores, PrintWriter writer) {
        try {
            // Ghi dòng tiêu đề
            writer.write("Subject Name,Semester Name,School Year,Student ID,Student Name,Score Column Name,Score Value\n");

            // Ghi thông tin từ danh sách studentScores
            for (StudentScoreDTO studentScore : studentScores) {
                writer.write(
                        studentScore.getSubjectName() + "," +
                                studentScore.getSemesterName() + "," +
                                studentScore.getSchoolYear() + "," +
                                studentScore.getStudentId() + "," +
                                studentScore.getStudentName() + "," +
                                studentScore.getScoreColumnName() + "," +
                                studentScore.getScoreValue() + "\n"
                );
            }

            System.out.println("Export to CSV response successful!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
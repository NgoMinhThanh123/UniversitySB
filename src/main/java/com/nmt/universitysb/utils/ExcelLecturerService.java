package com.nmt.universitysb.utils;

import com.nmt.universitysb.model.*;
import com.nmt.universitysb.repository.*;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

@Service
public class ExcelLecturerService {
    @Autowired
    private ClassesRepository classesRepository;
    @Autowired
    private FacultyRepository facultyRepository;
    public List<Lecturer> readLecturersFromExcelFile(File file) {
        List<Lecturer> lecturers = new ArrayList<>();
        try {
            FileInputStream excelFile = new FileInputStream(file);
            Workbook workbook = WorkbookFactory.create(excelFile);
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> iterator = sheet.iterator();

            while (iterator.hasNext()) {
                Row currentRow = iterator.next();
                if (currentRow.getRowNum() == 0) {
                    continue;
                }

                Lecturer lecturer = new Lecturer();

                Cell cellIdent = currentRow.getCell(4);
                String identification;
                if (cellIdent.getCellType() == CellType.NUMERIC) {
                    identification = String.valueOf((int) cellIdent.getNumericCellValue());
                } else {
                    identification = cellIdent.getStringCellValue();
                }
                Cell cell = currentRow.getCell(3);
                boolean gender = false;
                if (cell != null) {
                    if (cell.getCellType() == CellType.NUMERIC) {
                        gender = cell.getNumericCellValue() == 1;
                    } else {
                    }
                } else {
                }
                Cell cell11 = currentRow.getCell(11);
                Optional<Classes> classes = Optional.empty();

                if (cell11 != null) {
                    String classId = cell11.getStringCellValue();
                    if (classId != null && !classId.isEmpty()) {
                        classes = classesRepository.findById(classId);
                    } else {
                    }
                } else {
                }
                Optional<Faculty> faculty = facultyRepository.findById(currentRow.getCell(12).getStringCellValue());

                lecturer.setId(currentRow.getCell(0).getStringCellValue());
                lecturer.setName(currentRow.getCell(1).getStringCellValue());
                lecturer.setBirthday(currentRow.getCell(2).getDateCellValue());
                lecturer.setGender(gender);
                lecturer.setIdentification(identification);
                lecturer.setPhone(currentRow.getCell(5).getStringCellValue());
                lecturer.setAddress(currentRow.getCell(6).getStringCellValue());
                Cell cell7 = currentRow.getCell(7);
                String email = "";

                if (cell7 != null) {
                    email = String.valueOf(cell.getNumericCellValue());
                } else {
                }

                lecturer.setEmail(email);
                lecturer.setDegree(currentRow.getCell(8).getStringCellValue());
                lecturer.setPosition(currentRow.getCell(9).getStringCellValue());
                lecturer.setUserId(null);
                if (classes.isPresent()) {
                    lecturer.setClassesId(classes.get());
                } else {
                }
                lecturer.setFacultyId(faculty.get());

                lecturers.add(lecturer);
            }

            workbook.close();
            excelFile.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lecturers;
    }
}

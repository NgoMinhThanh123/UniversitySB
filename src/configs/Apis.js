import axios from "axios";
import VueCookies from "vue-cookies";

const SERVER_CONTEXT = "";
const SERVER = "http://localhost:8082";

export const endpoints = {
    "subjects": `${SERVER_CONTEXT}/api/subjects/`,
    "faculties": `${SERVER_CONTEXT}/api/faculties/`,
    "get-subject-by-facultyId": `${SERVER_CONTEXT}/api/subjects/facultyId/`,
    "login": `${SERVER_CONTEXT}/api/login/`,
    "register": `${SERVER_CONTEXT}/api/users/`,
    "semester": `${SERVER_CONTEXT}/api/semesters/`,
    "semester-student": `${SERVER_CONTEXT}/api/semesters/student/`,
    "current-user": `${SERVER_CONTEXT}/api/current-user/`,
    "get-user": `${SERVER_CONTEXT}/api/users/{username}/`,
    "user-id": `${SERVER_CONTEXT}/api/users-id/{id}/`,
    "get-student-by-username": `${SERVER_CONTEXT}/api/students-un/{username}/`,
    "student-home-room-teacher": `${SERVER_CONTEXT}/api/students-lecturer/{lecturerId}/`,
    "get-lecturer-by-username": `${SERVER_CONTEXT}/api/lecturers-un/{username}/`,
    "get-list-student": `${SERVER_CONTEXT}/api/get-list-student/`,
    "get-subject-by-lecturerId": `${SERVER_CONTEXT}/api/subjects/{lecturerId}/`,
    "get-subject-student": `${SERVER_CONTEXT}/api/subjects/studentId/`,
    "get-list-scores": `${SERVER_CONTEXT}/api/scores/`,
    "score-student": `${SERVER_CONTEXT}/api/scores/student-id/`,
    "score-list": `${SERVER_CONTEXT}/api/scores/list/`,
    "add-score": `${SERVER_CONTEXT}/api/add-score/`,
    "export": `${SERVER_CONTEXT}/api/scores/export-csv/`,
    "posts": `${SERVER_CONTEXT}/api/posts/`,
    "details": (postId) => `${SERVER_CONTEXT}/api/posts/${postId}/`,
    "comments":`${SERVER_CONTEXT}/api/posts/{id}/comments/`,
    "add-comment": `${SERVER_CONTEXT}/api/comments/`,
    "add-post": `${SERVER_CONTEXT}/api/add-post/`,
    "send-mail": `${SERVER_CONTEXT}/api/students/mails/`,
    "get-list-post-by-userId": `${SERVER_CONTEXT}/api/post-user/{userId}`,
    "update-post": `${SERVER_CONTEXT}/api/post-update/{postId}`,
    "delete-post": `${SERVER_CONTEXT}/api/posts-delete/{postId}`,
    "update-comment": `${SERVER_CONTEXT}/api/comment-update/{commentId}`,
    "delete-comment": `${SERVER_CONTEXT}/api/comments/{commentId}`,
    "course-register": `${SERVER_CONTEXT}/api/course-register/`,
}

export const authApi = () => {
    const token = VueCookies.get("token");
    return axios.create({
        baseURL: SERVER,
        headers: {
            "Authorization": `Bearer ${token}`
        }
    });
}

export default axios.create({
    baseURL: SERVER
})

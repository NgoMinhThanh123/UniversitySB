<template>
    <TheHeader />

    <div style="width: 100%;">
        <img src="../assets/khungTruong.png" style="width: 100%; height: 250px;" />
    </div>

    <div class="container-fluid mt-3 container" style="height: 100vh;">
        <div class="row">     
            <h2 class="welcome">Chào mừng đến với Đại Học Mở TP.HCM</h2>

           <Carousel />

            <div class="introduce">
                <div>
                    <h3>GIỚI THIỆU CHUNG</h3>
                    Được thành lập vào năm 1990 và trở thành trường đại học công lập từ năm 2006, đến nay Trường Đại học
                    Mở Thành phố Hồ Chí Minh là trường đại học đa ngành trực thuộc Bộ Giáo dục và Đào tạo, có nhiệm vụ
                    đào tạo đại học và sau đại học, với các hình thức đào tạo chính quy và giáo dục thường xuyên, đào
                    tạo các điểm vệ tinh,…nhằm đáp ứng nhu cầu học tập đa dạng của xã hội, góp phần tăng cường đội ngũ
                    cán bộ khoa học-kỹ thuật cho đất nước.
                </div>
            </div>
            <hr class="seperate-black" />

            <div class="info">
                <div>
                    <h5>Tên trường</h5>
                    <div>Tiếng Việt: Trường Đại học Mở Thành Phố Hồ Chí Minh</div>
                    <div>Tiếng Anh: Ho Chi Minh City Open University</div>
                    <h5>Tên viết tắt của trường</h5>
                    <div>Tiếng Việt: Trường Đại học Mở Tp. Hồ Chí Minh</div>
                    <div>Tiếng Anh: HCMCOU</div>
                    <h5>Tên trước đây</h5>
                    <div>Viện Đào Tạo Mở Rộng TP. Hồ Chí Minh (từ năm 1990)Đại học Mở Bán Công TP. Hồ Chí
                        Minh (từ năm 1993 đến năm 2005)</div>
                </div>
                <div>
                    <h5>Cơ quan/Bộ chủ quản</h5>
                    <div>Trường Đại học Mở TP. Hồ Chí Minh trực thuộc Bộ giáo dục và Đào tạo</div>
                    <h5>Địa chỉ liên lạc</h5>
                    <div>Số 97 Võ Văn Tần, Phường Võ Thị Sáu, Quận 3, TP. Hồ Chí Minh</div>
                    <div>Điện thoại: (028) 3930 0210</div>
                    <div>Fax: (028) 3930 0083</div>
                    <div>E-mail: ou@ou.edu.vn</div>
                    <div>Website: www.ou.edu.vn</div>
                </div>
            </div>

            <div class="view">
                <img loading="lazy" width="1300" height="2000"
                    src="https://ou.edu.vn/wp-content/uploads/2022/09/Sumang-TNOU2022.png" alt="" class="wp-image-33616"
                    srcSet="https://ou.edu.vn/wp-content/uploads/2022/09/Sumang-TNOU2022.png 2109w, https://ou.edu.vn/wp-content/uploads/2022/09/Sumang-TNOU2022-175x300.png 175w, https://ou.edu.vn/wp-content/uploads/2022/09/Sumang-TNOU2022-598x1024.png 598w, https://ou.edu.vn/wp-content/uploads/2022/09/Sumang-TNOU2022-768x1315.png 768w, https://ou.edu.vn/wp-content/uploads/2022/09/Sumang-TNOU2022-897x1536.png 897w, https://ou.edu.vn/wp-content/uploads/2022/09/Sumang-TNOU2022-1196x2048.png 1196w"
                    sizes="(max-width: 2109px) 100vw, 2109px" />
            </div>
            <div class="contain">
                <div class="logo">
                    <div>
                        <img class="alignnone size-full wp-image-47"
                            src="https://ou.edu.vn/wp-content/uploads/2016/08/Logo.png" alt="logo2" />
                    </div>
                    <div>
                        <div>
                            Sứ mạng: Trường Đại học Mở thành phố Hồ Chí Minh thực hiện giáo dục mở, tạo bình đẳng
                            cho mọi người trong giáo dục đại học, góp phần xây dựng xã hội học tập, nâng cao tri thức và
                            năng lực nghề nghiệp cho người học bằng các phương thức linh hoạt, thuận tiện và hiệu quả.
                        </div>
                        <div class="mission">
                            Tầm nhìn: Trường Đại học Mở thành phố Hồ Chí Minh phấn đấu trở thành Đại học thực hiện
                            giáo dục mở, định hướng ứng dụng với chất lượng cao.
                        </div>
                    </div>
                </div>
                <hr class="seperate" />


            </div>


        </div>
    </div>

    <TheFooter />
</template>



<script>
    import TheHeader from '../components/TheHeader.vue'
    import TheFooter from '../components/TheFooter.vue'
    import TheMenuHome from '../components/TheMenuHome.vue'
    import Carousel from '../components/Carousel.vue'
    export default {
        components: {
            TheHeader,
            TheFooter,
            TheMenuHome,
            Carousel,
        },


    }
</script>
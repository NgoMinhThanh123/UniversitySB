<template>
    
    <Form className="Auth-form-container">
    <div className="Auth-form">
                <div className="Auth-form-content">
                    <h3 className="Auth-form-title">Đăng Ký</h3>
                    <div className="form-group mt-3">
                        <label>Tài khoản</label>
                        <input
                            required
                            value=""
                            type="text"
                            className="form-control mt-1"
                            placeholder="Nhập tài khoản"
                        />
                    </div>
                    <div className="form-group mt-3">
                        <label>Mật khẩu</label>
                        <input
                            required
                            value=""
                            type="password"
                            className="form-control mt-1"
                            placeholder="Nhập mật khẩu"
                        />
                    </div>
                    <div className="form-group mt-3">
                        <label>Xác nhận Mật khẩu</label>
                        <input
                            required
                            value={user.confirmPass}
                            type="password"
                            className="form-control mt-1"
                            placeholder="Xác nhận mật khẩu"
                        />
                    </div>
                    <div className="form-group mt-3">
                        <label>Email</label>
                        <input
                            required
                            value={user.email}
                            type="email"
                            className="form-control mt-1"
                            placeholder="Email"
                        />
                    </div>
                    <div className="form-group mt-3">
                        <label>Avatar</label>
                        <input
                            required
                            type="file"
                            accept="image/*"
                            className="form-control mt-1"
                            placeholder="Avatar"
                        />
                        <label htmlFor="file" >
                            <span>Add an avatar</span>
                        </label>
                    </div>
                    <button type="submit">Đăng ký</button>
                </div>
            </div>
    </Form>
</template>

<script>
    export default {
        name: 'Register',
    }
</script>
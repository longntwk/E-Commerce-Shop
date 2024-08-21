import { Component, ViewChild } from '@angular/core';
import { LoginDTO } from '../../dtos/user/login.dto';
import { UserService } from '../../service/user.service';
import { Router } from '@angular/router';
import { NgForm } from '@angular/forms';
import { LoginResponse } from '../../responses/user/login.response';
import { TokenService } from 'src/app/service/token.service';
import { RoleService } from 'src/app/service/role.service';
import { Role } from '../models/role';



@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  @ViewChild('loginForm') loginForm!: NgForm;

  phoneNumber: string ='012345678';
  password: string ='123456';

  roles: Role[] = []; //mảng của role
  rememberMe: boolean = true;
  selectedRole: Role | undefined;

  onPhoneNumberChange(){
    console.log(`Phone typed: ${this.phoneNumber}`)
  }
  constructor(
    private router:Router, 
    private userService: UserService,
    private tokenService: TokenService,
    private roleService: RoleService
  ){}
  ngOnInit(){
    ///gọi api từ danh sách role và lưu vào biến role
    debugger
    this.roleService.getRoles().subscribe({
      next: (roles: Role[]) => { //sử kiểu role[]
        debugger
        this.roles = roles;
        this.selectedRole = roles.length > 0 ? roles[0] : undefined;
      },
      error: (error: any) =>{
        debugger
        console.error('Error getting roles: ', error);
      }
    })
  }
  login(){
    const message = `phone: ${this.phoneNumber}`+   
                    `Passrord: ${this.password}`;
    alert(message);
    debugger

    const loginDTO: LoginDTO ={
        // "phone_number":this.phoneNumber,
        // "password":this.password,
        phone_number: this.phoneNumber,
        password: this.password,
        role_id: this.selectedRole?.id ?? 1
    }
    this.userService.login(loginDTO).subscribe({
      next: (response: LoginResponse) =>{
        debugger
        const {token} = response
        this.tokenService.setToken(token);
        // // xử lý kết quả khi đăng ký thành công
        // if(reponse &&(reponse.status === 200 || reponse.status === 201)){
        //   this.router.navigate(['/login']);
        // }else{
        //   /// xử lý trường hợp không login thành công

        // }
      },
      complete: () =>{
        debugger
      },
      error: (error : any) =>{
        debugger
        alert(error?.error?.message)
      }
    })
  }
}

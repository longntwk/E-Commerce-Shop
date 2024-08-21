import { Component, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../../service/user.service';
import { RegisterDTO } from '../../dtos/user/register.dto';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent {
  @ViewChild('registerForm') registerForm!: NgForm;
  ///khai báo các biến trong môi trường trong dữ liệu tring form
  phoneNumber: string;
  password: string;
  retypePassword: string;
  fullName: string;
  address: string;
  isAcccepted: boolean;
  dateOfBirth: Date;


  constructor(private router:Router, private userService: UserService){
    // this.phone = '33445566';
    // this.password = '123456';
    // this.retypePassword= '123456';
    // this.fullName = 'nguyen van test';
    // this.address='vcl 123';
    // this.isAcccepted = true;
    // this.dateOfBirth = new Date;
    // this.dateOfBirth.setFullYear(this.dateOfBirth.getFullYear() -18);
    this.phoneNumber = '';
    this.password = '';
    this.retypePassword= '';
    this.fullName = '';
    this.address='';
    this.isAcccepted = true;
    this.dateOfBirth = new Date;
    this.dateOfBirth.setFullYear(this.dateOfBirth.getFullYear() -18);

  }
  onPhoneNumberChange(){
    console.log(`Phone typed: ${this.phoneNumber}`)
  }
  register(){
    const message = `phone: ${this.phoneNumber}`+   
                    `Passrord: ${this.password}`+
                    `retypePassword: ${this.retypePassword}`+
                    `fullName: ${this.fullName}`+
                    `address: ${this.address}`+
                    `isAcccepted: ${this.isAcccepted}`+
                    `dateOfBirth: ${this.dateOfBirth}`;

    alert(message);
    debugger

    const registerDTO: RegisterDTO ={
        "fullname":this.fullName,
        "phone_number":this.phoneNumber,
        "address":this.address,
        "password":this.password,
        "retype_password":this.retypePassword,
        "date_of_birth":this.dateOfBirth,
        "facebook_account_id": 0, 
        "google_account_id": 0,
        "role_id":1
    }
    this.userService.register(registerDTO).subscribe({
      next: (reponse: any) =>{
        debugger
        // xử lý kết quả khi đăng ký thành công
        if(reponse &&(reponse.status === 200 || reponse.status === 201)){
          this.router.navigate(['/login']);
        }else{
          /// xử lý trường hợp không login thành công

        }
      },
      complete: () =>{
        debugger
      },
      error: (error : any) =>{
        alert(`Cannot register, error: ${error.error}`)
      }
    })
  }
  checkPasswordMatch(){
    if(this.password !== this.retypePassword){
      this.registerForm.form.controls['retypePassword']
              .setErrors({'passwordMismatch':true});
    }else{
      this.registerForm.form.controls['retypePassword'].setErrors(null);  
    }
  }
  checkAge(){
    if(this.dateOfBirth){
      const today = new Date();
      const birthDate = new Date(this.dateOfBirth);
      let age = today.getFullYear() - birthDate.getFullYear();
      const monthDiff = today.getMonth() - birthDate.getMonth();
      if(monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())){
        age--;
      } 
      if(age < 18){
        this.registerForm.form.controls['dateOfBirth'].setErrors({'invalidAge': true});
      }else{
        this.registerForm.form.controls['dateOfBirth'].setErrors(null);
      }
    }
  }
}

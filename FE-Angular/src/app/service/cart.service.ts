import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../environment/environment';
import { Category } from '../components/models/category';
import { ProductService } from './product.service';
@Injectable({
  providedIn: 'root'
})
export class CartService {
    private cart: Map<number, number> = new Map() /// dùng map để lưu giỏ hàng, key id , value là số lượng

    constructor(private productService: ProductService){
        const storedCart = localStorage.getItem('cart');
        if(storedCart){
            this.cart = new Map(JSON.parse(storedCart));
        }
    }
    addToCart(productId: number, quantity: number = 1): void{
        debugger
        if(this.cart.has(productId)){
            //Nếu sản phẩm da04 có trong giỏ hàng, tăng số lượng lên `quantity`
            this.cart.set(productId, this.cart.get(productId)! + quantity);
        }else{
            //Nếu sản phẩm chưa có trong giỏ hàng , thêm sản phẩm với số lượng là `quantity`
            this.cart.set(productId, quantity);
        }
        ///sau khi thay đổi giỏ hàng lưu vào localStorge
        this.saveCartToLocalStorage();
    }
    getCart(): Map<number, number>{
        return this.cart;
    }
    private saveCartToLocalStorage(): void{
        localStorage.setItem('cart', JSON.stringify(Array.from(this.cart.entries())));
    }
    clearCart(): void{
        this.cart.clear();
        this.saveCartToLocalStorage();
    }
}
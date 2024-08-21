import { Component, OnInit } from '@angular/core';
import { ProductService } from 'src/app/service/product.service';
import { Product } from '../models/product';
import { environment } from 'src/app/environment/environment';
import { Category } from '../models/category';
import { CategoryService } from 'src/app/service/category.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit{
  products: Product[] = [];
  categories: Category[] = [];
  currentPage: number = 0;
  itemsPerPage: number = 12;
  pages: number[] = [];
  totalPages: number = 0;
  visiblePages: number[] = [];
  keyword:string="";
  selectedCategoryId:number=0;
  


  constructor(
    private productServie: ProductService,
    private categoryService: CategoryService
  ) {}
  ngOnInit(){
    this.getProducts(this.keyword, this.selectedCategoryId,this.currentPage, this.itemsPerPage);
    this.getCategories(1,100);
  }
  getCategories(page: number, limit: number){
    this.categoryService.getCategories(page, limit).subscribe({
      next: (categories: Category[]) =>{
        debugger
        this.categories = categories;
      },
      complete: () =>{
        debugger
      },
      error: (error: any) =>{
        console.error('Error fetching categories:', error);
      }
    });
  }
  searchProducts(){
    this.currentPage = 0;
    this.itemsPerPage = 12;
    debugger
    this.getProducts(this.keyword, this.selectedCategoryId, this.currentPage, this.itemsPerPage)
  }
  getProducts(keyword:string, selectedCategoryId:number, page: number, limit: number){
    debugger
    this.productServie.getProducts(keyword, selectedCategoryId, page, limit).subscribe({
      next: (response: any) => {
        debugger
        response.products.forEach((products: Product) =>{
          products.url = `${environment.apiBaseUrl}/products/images/${products.thumbnail}`;
        });
        this.products = response.products
        this.totalPages = response.totalPages
        this.visiblePages = this.generateVisiblePageArray(this.currentPage, this.totalPages);
      },
      complete: () =>{
        debugger;
      },
      error: (error: any) =>{
        debugger
        console.error('Error fetching peoducts', error);
      }
    });
  }
  onPageChange(page: number){
    // Trang đầu tiên (0) sẽ được chọn nếu người dùng nhấn vào "First"
    this.currentPage = page;
    this.getProducts(this.keyword, this.selectedCategoryId, this.currentPage, this.itemsPerPage);
}

  // onPageChange(page: number){
  //   debugger;
  //   this.currentPage = page;
  //   this.getProducts( this.keyword, this.selectedCategoryId,this.currentPage, this.itemsPerPage);
  // }
  // generateVisiblePageArray(currentPage: number, totalPages: number): number[] {
  //   const maxVisiblePages = 5;
  //   const halfVisiablePages = Math.floor(maxVisiblePages / 2);

  //   let startpage = Math.max(currentPage - halfVisiablePages, 1);
  //   let endPage = Math.min(startpage + maxVisiblePages - 1, totalPages);

  //   if(endPage - startpage + 1 < maxVisiblePages){
  //     startpage = Math.max(endPage - maxVisiblePages + 1, 1);
  //   }
  //   return new Array(endPage -startpage + 1).fill(0).map((_, index) => startpage + index);
  // }
  generateVisiblePageArray(currentPage: number, totalPages: number): number[] {
    const maxVisiblePages = 5;
    const halfVisiblePages = Math.floor(maxVisiblePages / 2);

    let startPage = Math.max(currentPage - halfVisiblePages, 0); // Bắt đầu từ trang 0
    let endPage = Math.min(startPage + maxVisiblePages - 1, totalPages - 1); // Kết thúc trang

    if (endPage - startPage + 1 < maxVisiblePages) {
        startPage = Math.max(endPage - maxVisiblePages + 1, 0);
    }

    return new Array(endPage - startPage + 1).fill(0).map((_, index) => startPage + index + 1); // Thay đổi +1 cho số trang 1-based trong UI
}

}


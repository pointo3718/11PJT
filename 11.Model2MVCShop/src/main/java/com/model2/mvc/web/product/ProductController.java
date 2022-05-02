package com.model2.mvc.web.product;

import java.awt.Menu;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

//��ǳ���� Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	//Field
	@Autowired
	@Qualifier("ProductServiceImpl")
	private ProductService productService;
	//setter Method ���� X
	
	public ProductController() {
		System.out.println(this.getClass());
		//getClass() : ��ü�� ���ϴ� Ŭ������ ������ �˾Ƴ��� �޼ҵ��̴�.
	}
	
	// @Value : properties ���Ͽ� ������ ������ Spring ������ ����
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception{

		System.out.println("/product/addProduct : GET");

		return "redirect:/product/addProductView.jsp";
	}
	
	//@RequestMapping ��û�� ���� �� � ��Ʈ�ѷ��� ȣ���� �Ǿ�� �ϴ��� �˷��ִ� ��ǥ
//	@RequestMapping("/addProduct.do")
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product")Product product,@RequestParam("manuDate")String manuDate) throws Exception{

		System.out.println("/product/addProduct : POST");

		product.setManuDate(manuDate.replace("-", ""));
		productService.addProduct(product);
		
		return "redirect:/product/addProductView.jsp";
	}
	
	/* @RequestParam 
	 * 1���� HTTP �Ķ���͸� ��� ���� ����
	 * �ʼ� ���ΰ� true�̱� ������ �ݵ�� �ʿ��� ��찡 �ƴ϶�� required=false ������ �ʿ���
	 * @ModelAttribute 
	 * multipart/form-data ���·� ���� HTTP Body �����Ϳ� HTTP �Ķ���͵��� Setter�� ���� 1��1�� ��ü�� ���ε���Ŵ
	 * ��ȯ�� �ƴ� ���� ���Խ�Ű�Ƿ�, �������� �����ڳ� Setter�Լ��� ������ �������� ������� ����
	 */
	//@RequestMapping("getProduct")
	//@RequestParam("������ �������� �̸�") [������Ÿ��] [�����µ����͸� ���� ����] �������� ��� model ��ü�� �̿��ؼ� view �� ����.
	@RequestMapping( value="getProduct", method=RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model ) throws Exception {
		
		System.out.println("/product/getProduct");
		
		Product product= productService.getProduct(prodNo);
		
		//model.addAttribute�� (key,value) �޼ҵ��̿��ؼ� view �����ҵ����� ����
		model.addAttribute("product",product);
		
		return "forward:/product/getProduct.jsp";
	}
	
//	@RequestMapping("/product/updateProductView")
	@RequestMapping( value="updateProductView", method=RequestMethod.GET)
	public String updateProductView(@RequestParam("prodNo") int prodNo, Model model ) throws Exception {
		
		System.out.println("/updateProductView.do");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product",product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
//	@RequestMapping("/product/updateProduct")
	@RequestMapping( value="updateProduct", method=RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product")Product product, Model model) throws Exception{
	
		System.out.println("/product/updateProduct");
//		Product prodNo=productService.getProduct(product.getProdNo());
		
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}
	
//	@RequestMapping("/product/listProduct")
	@RequestMapping( value="listProduct")
	public String listProduct(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception {
		
		System.out.println("/product/listProduct");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);	
		
		Map<String , Object> map = productService.getProductList(search);
		
		Page resultPage	= new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}

}

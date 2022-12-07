package model.dto;

public class DTOPage {
	
	private int startPage=0;//화면 하단 페이지 시작번호
	private int endPage;//화면 하단 페이지 마지막번호
	private int endpage;//화면 하단 페이지 종료번호
	private boolean prev,next;//이전,이후 버튼 표시 여부
	private int total;//총 게시물 건수	
	private int PageNum;//현제 페이지
	private int Amount;//한 페이지당 보여지는 게시물 수
	private int limit;//한 페이지당 보여지는 게시물 시작	
	private int offset;//한 페이지당 보여지는 게시물 끝
	
	public DTOPage() {};
	
	public DTOPage(int pageNum,int total, int Amount) {
		int num=0;
		this.PageNum = pageNum;
		this.Amount = Amount;
		this.total = total;		
		System.out.println("전체 글 DTO : "+total);
		
		if(total%Amount !=0) {
			num = 1;//게시글 반올림
		}
		
		this.endPage = (int)(Math.ceil(total / Amount))+num;
		System.out.println("전체 페이지 : "+endPage);		
		if(pageNum == 1) {
			this.limit = pageNum-1;
		}else {
			this.limit = (pageNum-1)*Amount;	
		}
		int length = (int)(Math.log10(pageNum)+1);
		//System.out.println("시작 글 DTO : "+limit);
		
		//하한페이징 번호
		int num1 = 0;
		int num10 = 0;
		int num100 = 0;
		int num1000 =0;
		if(length==1) {
			num1 = (int)Math.ceil(pageNum%10);
		}else if(length==2) {
			num1 = (int)Math.ceil(pageNum%10);
			num10 = (int)Math.ceil((pageNum/10)%100)*10;
		}else if(length==3) {
			num1 = (int)Math.ceil(pageNum%10);
			num10 = (int)Math.ceil((pageNum/10)%100)*10;
			num100 = (int)Math.ceil((pageNum/100)%1000)*100;
		}else if(length==4) {
			num1 = (int)Math.ceil(pageNum%10);
			num10 = (int)Math.ceil((pageNum/10)%100)*10;
			num100 = (int)Math.ceil((pageNum/100)%1000)*100;
			num1000 = (int)Math.ceil((pageNum/1000)%10000)*1000;
		}
		int numfin = num10+num100+num1000;
		
		if(pageNum>=10) {//페이지가 10보다 높을때 시작페이지 설정
			this.startPage = numfin;			
		}
		
		this.endpage = startPage+9;
		if(endpage>endPage)this.endpage=endPage;
		
		System.out.println("startpage:"+startPage);
		//System.out.println("endpage:"+endpage);
		
		this.offset = Amount;
		//System.out.println("페이지 마지막 글 DTO : "+offset);
	
		this.prev = this.PageNum <= 1;//1page = true;	
		
		this.next = pageNum >= this.endPage;//page가 마지막 페이지보다 크거나 같으면 false;		
		//System.out.println("next:"+next);
		//System.out.println("prev:"+prev);
	}
	
	
	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		return offset;
	}


	public void setOffset(int offset) {		
		this.offset = offset;
	}	
	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getPageNum() {
		return PageNum;
	}


	public void setPageNum(int pageNum) {
		PageNum = pageNum;
	}


	public int getAmount() {
		return Amount;
	}


	public void setAmount(int amount) {
		Amount = amount;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}


	
	
	
	
		
		
	

}

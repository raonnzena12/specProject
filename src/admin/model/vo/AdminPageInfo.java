package admin.model.vo;

public class AdminPageInfo {
	
	private int count;
	private int limit;
	private int PagingBarSize;
	private int currentPage;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public AdminPageInfo() {}

	public AdminPageInfo(int count, int limit, int pagingBarSize, int currentPage, int maxPage, int startPage,
			int endPage) {
		super();
		this.count = count;
		this.limit = limit;
		PagingBarSize = pagingBarSize;
		this.currentPage = currentPage;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getPagingBarSize() {
		return PagingBarSize;
	}

	public void setPagingBarSize(int pagingBarSize) {
		PagingBarSize = pagingBarSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
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

	@Override
	public String toString() {
		return "AdminPageInfo [count=" + count + ", limit=" + limit + ", PagingBarSize=" + PagingBarSize
				+ ", currentPage=" + currentPage + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}

}

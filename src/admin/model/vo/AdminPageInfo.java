package admin.model.vo;

public class AdminPageInfo {
	
	private int count;
	private int limit;
	private int pagingBarSize;
	private int currentPage;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int sortNum;
	private int searchType;
	private String keyWord;
	
	public AdminPageInfo() {}

	public AdminPageInfo(int count, int limit, int pagingBarSize, int currentPage, int maxPage, int startPage,
			int endPage) {
		super();
		this.count = count;
		this.limit = limit;
		this.pagingBarSize = pagingBarSize;
		this.currentPage = currentPage;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	
	public AdminPageInfo(int count, int limit, int pagingBarSize, int currentPage, int maxPage, int startPage,
			int endPage, int sortNum) {
		this(count, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
		this.sortNum = sortNum;
	}
	
	

	public AdminPageInfo(int count, int limit, int pagingBarSize, int currentPage, int maxPage, int startPage,
			int endPage, int sortNum, int searchType, String keyWord) {
		this(count, limit, pagingBarSize, currentPage, maxPage, startPage, endPage, sortNum);
		this.searchType = searchType;
		this.keyWord = keyWord;
	}

	public int getSearchType() {
		return searchType;
	}

	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public int getSortNum() {
		return sortNum;
	}

	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
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
		return pagingBarSize;
	}

	public void setPagingBarSize(int pagingBarSize) {
		this.pagingBarSize = pagingBarSize;
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
		return "AdminPageInfo [count=" + count + ", limit=" + limit + ", PagingBarSize=" + pagingBarSize
				+ ", currentPage=" + currentPage + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}

}

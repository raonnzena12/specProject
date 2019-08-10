package mobile.model.util;

public class CreateQuery {
	public CreateQuery() {}
	
	public String createBrandq(String[] bArr) {
		String query = " AND BRAND IN ( ";
		for ( int i = 0 ; i < bArr.length ;  i++ ) {
			switch( bArr[i] ) {
			case "samsung" : query += "\'삼성전자\'"; break;
			case "lgelec" : query += "\'LG전자\'"; break;
			case "apple" : query += "\'애플\'"; break;
			case "pantech" : query += "\'팬택\'"; break;
			case "htc" : query += "\'HTC\'"; break;
			case "motorola" : query += "\'모토로라\'"; break;
			case "kttech" : query += "\'KT Tech\'"; break;
			case "sktelesys" : query += "\'SK 텔레시스\'"; break;
			case "sonymobile" : query += "\'소니 모바일\'"; break;
			case "nokia" : query += "\'노키아\'"; break;
			default : break;
			}
			query += ( i == bArr.length-1 || i == 0 ) ? "" : ",";
		}
		query += " ) "; 
		return query;
	}

	public String createBatteryq(String[] strArr) {
		String query = " AND \"배터리\" > " + strArr[1] +" AND \"배터리\" < " + strArr[2];
		return query;
	}
}

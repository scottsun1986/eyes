package util;


import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import mybatis.dao.CustMapper;
import mybatis.dao.DvrMapper;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BeanGetter {
	private static ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

	public static Object getBean(String beanName) { 
		return ctx.getBean(beanName);
	}

	public static void main(String[] args) throws FileNotFoundException, SQLException {
	
		CustMapper cm=(CustMapper)BeanGetter.getBean("custMapper");
		System.out.println(cm.selectByKey("营业厅").size());

	//	GridbuildingMapper fm=(GridbuildingMapper)BeanGetter.getBean("gridbuildingMapper");
		//System.out.println(((Gridbuilding)fm.selectAll()).getUdepartment());
	//	PageHelper.startPage(2,20);
		
//		Gridbuilding gb=new Gridbuilding();
//				gb.setAcceptTime(DateHelper.getCurrentYYYYMMDDHHMMSS());
//		gb.setHasAssess(true);
//		gb.setName("测试区域2");
//		fm.insert(gb);
	
//	System.out.println(fm.selectByAll(null, "苏宁环球", null, null, null, null, null, null, null, null, null, null).size());
//	
//	List<Gridbuilding> t=fm.selectByAll(null, "苏宁环球", null, null, null, null, null, null, null, null, null, null);
//	System.out.println(t.get(0).getName());
//	System.out.println(t.get(1).getId());
//	
	
	
	//UserMapper cm=(UserMapper)BeanGetter.getBean("userMapper");
//		DvrMapper cm=(DvrMapper)BeanGetter.getBean("dvrMapper");
//	//cm.updateAuthCode("nj4690",RandomNumber.getCharAndNumr(4));
//	//System.out.println(cm.selectByProdIdAndBillMonths("1", new String[]{"201504","201503"}).getBillList());
//	System.out.println(cm.selectByAll("南京", "玄武", null,"华为", null, null).get(0).getCust().getContact());
	//System.out.println(cm.selectByPkPwImsi("nj4690", "E10ADC3949BA59ABBE56E057F20F883E", "460036660160574").getName());
	//	System.out.println(((Page)fm.selectAll()).getPageSize());
		
//List<VItem> news = im.getLatestItems(new Integer(101), 0, 10);
//System.out.println(news.size());
//		OmOrderManager f=(OmOrderManager)BeanGetter.getBean("OmOrderManager");
//		OmOrder s=(OmOrder)f.findByOrderCode("030").get(0);
//	System.out.println(s.getOmSoSla());
//	 ConfDAO sss=(ConfDAO)BeanGetter.getBean("ConfDAO");
//	 System.out.println(sss.findAll().size())
//	;
		
	}
public static  String getMonth(int ref) {
	Calendar rightNow = Calendar.getInstance();
	SimpleDateFormat fmt = new SimpleDateFormat("yyyyMM");
	rightNow.add(Calendar.MONTH, ref);

	// ��ʽ��Сд�����
	String sysDatetime = fmt.format(rightNow.getTime());
	return sysDatetime;
}

}

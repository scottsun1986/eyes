package action;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import mybatis.dao.CustMapper;
import mybatis.dao.DvrMapper;
import mybatis.model.Cust;
import mybatis.model.Dvr;

import org.apache.struts2.ServletActionContext;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ActionSupport;

public class ManageAction extends ActionSupport{
	private CustMapper custMapper;
	private Map responseJson;

	public Map getResponseJson() {
		return responseJson;
	}

	public void setResponseJson(Map responseJson) {
		this.responseJson = responseJson;
	}
	private String custsKey;
	public String getCustsKey() {
		return custsKey;
	}
	public void setCustsKey(String custsKey) {
		this.custsKey = custsKey;
	}
	public CustMapper getCustMapper() {
		return custMapper;
	}
	public void setCustMapper(CustMapper custMapper) {
		this.custMapper = custMapper;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getPlatformType() {
		return platformType;
	}
	public void setPlatformType(String platformType) {
		this.platformType = platformType;
	}
	public String getPuid() {
		return puid;
	}
	public void setPuid(String puid) {
		this.puid = puid;
	}
	public String getBandNumber() {
		return bandNumber;
	}
	public void setBandNumber(String bandNumber) {
		this.bandNumber = bandNumber;
	}
	public DvrMapper getDvrMapper() {
		return dvrMapper;
	}
	public void setDvrMapper(DvrMapper dvrMapper) {
		this.dvrMapper = dvrMapper;
	}
	private String searchKey;
	private String status;
	private String zone;
	private String platformType;
	private String puid;
	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getPuName() {
		return puName;
	}

	public void setPuName(String puName) {
		this.puName = puName;
	}

	public String getPlatformAccount() {
		return platformAccount;
	}

	public void setPlatformAccount(String platformAccount) {
		this.platformAccount = platformAccount;
	}

	public String getBandSpeed() {
		return bandSpeed;
	}

	public void setBandSpeed(String bandSpeed) {
		this.bandSpeed = bandSpeed;
	}

	public String getBandMode() {
		return bandMode;
	}

	public void setBandMode(String bandMode) {
		this.bandMode = bandMode;
	}

	public String getBandDevice() {
		return bandDevice;
	}

	public void setBandDevice(String bandDevice) {
		this.bandDevice = bandDevice;
	}

	public String getBandPort() {
		return bandPort;
	}

	public void setBandPort(String bandPort) {
		this.bandPort = bandPort;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getDvr() {
		return dvr;
	}

	public void setDvr(String dvr) {
		this.dvr = dvr;
	}

	public String getDiskSize() {
		return diskSize;
	}

	public void setDiskSize(String diskSize) {
		this.diskSize = diskSize;
	}

	public String getDiskType() {
		return diskType;
	}

	public void setDiskType(String diskType) {
		this.diskType = diskType;
	}

	public String getDvrAddress() {
		return dvrAddress;
	}

	public void setDvrAddress(String dvrAddress) {
		this.dvrAddress = dvrAddress;
	}

	public String getCameraType() {
		return cameraType;
	}

	public void setCameraType(String cameraType) {
		this.cameraType = cameraType;
	}

	public String getCameraNum() {
		return cameraNum;
	}

	public void setCameraNum(String cameraNum) {
		this.cameraNum = cameraNum;
	}

	public String getCameraDesc() {
		return cameraDesc;
	}

	public void setCameraDesc(String cameraDesc) {
		this.cameraDesc = cameraDesc;
	}

	public String getCameraDvrLength() {
		return cameraDvrLength;
	}

	public void setCameraDvrLength(String cameraDvrLength) {
		this.cameraDvrLength = cameraDvrLength;
	}

	public String getPropertyRight() {
		return propertyRight;
	}

	public void setPropertyRight(String propertyRight) {
		this.propertyRight = propertyRight;
	}
	private String custId;
	private String puName;
	private String platformAccount;
	private String bandSpeed;
	private String bandMode;
	private String bandDevice;
	private String bandPort;
	private String ip;
	private String dvr;
	private String diskSize;
	private String diskType;
	private String dvrAddress;
	private String cameraType;
	private String cameraNum;
	private String cameraDesc;
	private String cameraDvrLength;
	private String propertyRight;
	private String bandNumber;
	private String type;
		public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
		private DvrMapper dvrMapper;
	private Integer currentPage;
	private Integer custCurrentPage;
	public Integer getCustCurrentPage() {
		return custCurrentPage;
	}

	public void setCustCurrentPage(Integer custCurrentPage) {
		this.custCurrentPage = custCurrentPage;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public String searchByAll(){
		Map session = ServletActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		if (currentPage == null)
			PageHelper.startPage(1, 20);
		else
			PageHelper.startPage(currentPage, 20);
	
		List<Dvr> dvrs=dvrMapper.selectByAll(searchKey, zone, status, platformType, puid, bandNumber,type);
	 
		request.setAttribute("currentDvrs", dvrs);
	//	if(searchKey!=null)
		//request.setAttribute("searchKey", searchKey);
		PageInfo pi = new PageInfo(dvrs);
		session.put("pageInfo", pi);
		ServletActionContext.setRequest(ServletActionContext.getRequest());
		return "success";
		
		 
	}
	public String custSearchByAll(){
		Map session = ServletActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		if (custCurrentPage == null)
			PageHelper.startPage(1, 20);
		else
			PageHelper.startPage(custCurrentPage, 20);
	
		List<Cust> custs=custMapper.custSelectByAll(type, status, owner, name, searchKey);
		request.setAttribute("currentCusts", custs);
	//	if(searchKey!=null)
		//request.setAttribute("searchKey", searchKey);
		PageInfo pi = new PageInfo(custs);
		session.put("pageInfo", pi);
		ServletActionContext.setRequest(ServletActionContext.getRequest());
		return "success";
		
		 
	}
	public String goToAddNewDvr(){
		return "success";
	}
	
	private String id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String gotoDvrDetailPage(){
		if(id!=null&&!id.trim().equals("")){
		Dvr currentDvr=dvrMapper.selectByPrimaryKey(new Integer(id));
	 
		HttpServletRequest request = ServletActionContext.getRequest();
	 
		request.setAttribute("currentDvr", currentDvr);
	//	if(searchKey!=null)
		//request.setAttribute("searchKey", searchKey);
	 
		ServletActionContext.setRequest(ServletActionContext.getRequest());
	 
		return "success";}
		return "";
	}
	public String goCustMainPage(){
		return "success";
	}
	public String goMainPage(){
		return "success";
	}
	
	public String gotoAddNewCust(){
		return "success";
	}
	public String findCustsList(){
		List<Cust> custList = custMapper.selectByKey(custsKey);
		Map returned = new HashMap();
		returned.put("custList", custList);
		this.setResponseJson(returned);
		return SUCCESS;
	}
	
	
	public String addNewDvr(){
		System.out.println(custId+":"+cameraNum);
		Dvr d=new Dvr();
		d.setBandDevice(bandDevice);
		d.setBandMode(bandMode);
		d.setBandNumber(bandNumber);
		d.setBandPort(bandPort);
		d.setBandSpeed(bandSpeed);
		d.setCameraDesc(cameraDesc);
		d.setCameraDvrLength(cameraDvrLength);
		if(cameraNum!=null&&!cameraNum.trim().equals(""))
		d.setCameraNum(new Integer(cameraNum));
		d.setCameraType(cameraType);
		d.setCustId(new Integer(custId));
		d.setDiskSize(diskSize);
		d.setDiskType(diskType);
		d.setDvr(dvr);
		d.setDvrAddress(dvrAddress);
		d.setIp(ip);
		d.setPlatformAccount(platformAccount);
		d.setPlatformType(platformType);
		d.setPropertyRight(propertyRight);
		d.setPuid(puid);
		d.setPuName(puName);
		
		dvrMapper.insert(d);
		return "success";
	}
	
	
	
	public String addNewCust(){
		
		Cust d=new Cust();
		d.setAddress(address);
		d.setContact(contact);
		d.setContactPhone(contactPhone);
		d.setCustMgr(custMgr);
		d.setCustMgrPhone(custMgrPhone);
		d.setName(name);
		d.setOwner(owner);
		d.setStatus(status);
		d.setType(type);
		d.setZone(zone);
		
		custMapper.insert(d);
		return "success";
	}
	
	
	
	 public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getCustMgr() {
		return custMgr;
	}

	public void setCustMgr(String custMgr) {
		this.custMgr = custMgr;
	}

	public String getCustMgrPhone() {
		return custMgrPhone;
	}

	public void setCustMgrPhone(String custMgrPhone) {
		this.custMgrPhone = custMgrPhone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	private String owner;
 
	    private String name;
 
	    private String contact;
 
	    private String contactPhone;

	 
	    private String custMgr;

	   
	    private String custMgrPhone;

	 
	  
	 
 
	    private String address;
  
}

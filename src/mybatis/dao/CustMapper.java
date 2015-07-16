package mybatis.dao;

import java.util.List;

import mybatis.model.Cust;
import mybatis.model.CustExample;
import mybatis.model.Dvr;

import org.apache.ibatis.annotations.Param;

public interface CustMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    int countByExample(CustExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    int deleteByExample(CustExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    int insert(Cust record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    int insertSelective(Cust record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    List<Cust> selectByExample(CustExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    Cust selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    int updateByExampleSelective(@Param("record") Cust record, @Param("example") CustExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    int updateByExample(@Param("record") Cust record, @Param("example") CustExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    int updateByPrimaryKeySelective(Cust record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cust
     *
     * @mbggenerated Thu Jun 25 09:38:55 CST 2015
     */
    int updateByPrimaryKey(Cust record);
    
    
    List<Cust> selectByKey(@Param("custKey") String custKey);
    
    
    List<Cust> custSelectByAll(@Param("type")String type,@Param("status")String status,@Param("owner")String owner,@Param("name")String name,@Param("searchKey")String searchKey);
}
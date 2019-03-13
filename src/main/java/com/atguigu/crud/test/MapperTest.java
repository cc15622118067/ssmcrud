package com.atguigu.crud.test;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    SqlSession sqlSession;


    @Test
    public void test(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        EmployeeMapper mapper = ctx.getBean(EmployeeMapper.class);
//        List<Employee> employees = mapper.selectAll();
//        for (Employee employee:employees){
//            System.out.println(employee);
//        }
//        Employee employee = mapper.selectByPrimaryKey(1);
//        Employee employee1 = new Employee(null,"ccj","1","111@qq.com",1);
//        mapper.insert(employee1);

        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdEqualTo(1);
        List<Employee> employees = mapper.selectByExample(employeeExample);
        System.out.println(employees);

    }

    @Test
    public void test02(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        EmployeeMapper mapper = ctx.getBean(EmployeeMapper.class);
//        Employee employee = mapper.selectByPrimaryKeyWithDept(1);
//        System.out.println(employee.getDepartment());
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdEqualTo(1);
        EmployeeExample.Criteria criteria1 = example.createCriteria();
        criteria1.andEmpIdEqualTo(3);
        example.or(criteria1);
        List<Employee> employees = mapper.selectByExampleWithDept(example);
        for (Employee employee1 :employees){
            System.out.println(employee1);
        }
    }

    @Test
    public void testCRUD(){
//        插入部门
//        departmentMapper.insert(new Department(null,"开发部"));
//        departmentMapper.insert(new Department(null,"测试部"));

//        插入1个员工
        employeeMapper.insertSelective(new Employee(null,"Jerry","1","911@163.com",1));

//        插入1000条数据,批量操作.
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0;i<1000;i++){
            String s = UUID.randomUUID().toString().substring(0, 5)+i;
        int v = (int) (0+Math.random()*2);
            String gender = String.valueOf(v);
            mapper.insertSelective(new Employee(null,s,gender,s+"@163.com",1));
        }
        System.out.println("批量插入成功");

//        批量删除
//        for(int i = 3000;i<4000;i++) {
//            employeeMapper.deleteByPrimaryKey(i);
//        }
//        for (int i = 0;i<30;i++){
//            int v = (int) (0+Math.random()*2);
//            String gender = String.valueOf(v);
//            System.out.println(gender);
//        }
    }

    @Test
    public void newtest()
    {
        List<Employee> empWithDpet = employeeMapper.getEmpWithDpet();
        for (Employee e:empWithDpet){
            System.out.print(e.getEmail()+" ");
            System.out.print(e.getEmpName()+" ");
            System.out.print(e.getGender()+" ");
            System.out.print(e.getDepartment().getDeptName());
            System.out.println("");
        }
    }
}

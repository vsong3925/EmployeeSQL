/* Task 1: List the following details of each employee: employee number, last name, first name, sex, and salary. */
select
  emp.emp_no, 
  emp.last_name, 
  emp.first_name, 
  emp.sex,
  sal.salary
from 
  employees as emp
  left join salaries as sal
  using (emp_no)
order by emp.emp_no;

/* Task 2: List first name, last name, and hire date for employees who were hired in 1986. */
select
   first_name,
   last_name,
   hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

/* Task 3: List the manager of each department with the following information: 
   department number, department name, the manager's employee number, last name, first name.*/
select
   dm.dept_no,
   dept.dept_name,
   dm.emp_no,
   emp.last_name,
   emp.first_name
from dept_manager as dm
   inner join departments as dept
       using (dept_no)
   inner join employees as emp
       using (emp_no)
order by emp.emp_no;
	   
/* Task 4: List the department of each employee with the following information: 
   employee number, last name, first name, and department name.*/
select 
   emp.emp_no,
   emp.last_name,
   emp.first_name,
   dept.dept_name
from employees as emp
   inner join dept_emp as de
     using (emp_no)
   join departments as dept
     using (dept_no)
order by dept.dept_name, emp.emp_no;
   
/* Task 5: List first name, last name, and sex for employees 
   whose first name is "Hercules" and last names begin with "B."*/
select 
   first_name, 
   last_name,
   sex
from employees
   where first_name = 'Hercules' 
   and last_name like 'B%'
order by last_name;

/* Task 6: List all employees in the Sales department, 
   including their employee number, last name, first name, and department name.*/
select 
   emp.emp_no,
   emp.last_name,
   emp.first_name,
   dept.dept_name
from employees as emp
   join dept_emp as de
      using (emp_no)
   join departments as dept
      using (dept_no)
order by emp.emp_no;

/* Task 7: List all employees in the Sales and Development departments, 
   including their employee number, last name, first name, and department name.*/
select 
   emp.emp_no,
   emp.last_name,
   emp.first_name,
   dept.dept_name
from employees as emp
   join dept_emp as de
      using (emp_no)
   join departments as dept
      using (dept_no)
where dept_name in ('Sales', 'Development')
order by emp.emp_no;

/* Task 8: In descending order, list the frequency count of employee last names, 
   i.e., how many employees share each last name.*/
select
   last_name, count(last_name) as last_name_count
from employees
group by last_name
order by last_name_count desc;
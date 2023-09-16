-- Data Analysis
--____________________________________________________________________________________________________

-- 1.  List the employee number, last name, first name, sex, and salary of each employee

select	emp.emp_no,
		emp.last_name,
		emp.first_name,
		emp.sex,
		sal.salary

from employees as emp
	left join salaries as sal
	on (emp.emp_no = sal.emp_no)
order by emp.emp_no;


-- 2.  List the first name, last name, and hire date for the employees who were hired in 1986

select first_name, last_name, hire_date
from employees
where extract (year from hire_date) = 1986;


-- 3.  List the manager of each department along with their department number, department name, employee number, last name, and first name

select	dm.dept_no,
		d.dept_name,
		dm.emp_no,
		e.last_name,
		e.first_name
		
from dept_manager as dm
		inner join departments as d
			on (dm.dept_no = d.dept_no)
		inner join employees as e
			on (dm.emp_no = e.emp_no);


-- 4.  List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
			
order by employees.emp_no;


-- 5.  List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

select first_name, last_name, birth_date, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';


-- 6.  List each employee in the Sales department, including their employee number, last name, and first name

JUST HEADERS, NO DATA

select	e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name

from employees as e
		inner join dept_emp as de
			on (e.emp_no = de.emp_no)
		inner join departments as d
			on (de.dept_no = d.dept_no)
			
where d.dept_name = 'Sales'
order by e.emp_no;


-- 7.  List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

JUST HEADERS, NO DATA

select	e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name

from employees as e
		inner join dept_emp as de
			on (e.emp_no = de.emp_no)
		inner join departments as d
			on (de.dept_no = d.dept_no)
			
where d.dept_name in ('Sales', 'Development')
order by e.emp_no;


-- 8.  List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

select	last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;


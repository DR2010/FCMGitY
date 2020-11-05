using FCMMySQLBusinessLibrary.Model.ModelClient;
using MackkadoITFramework.ErrorHandling;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FCMMySQLBusinessLibrary
{
    public interface IEmployee
    {
        event EventHandler<EventArgs> EmployeeList;
        event EventHandler<EventArgs> EmployeeAdd;
        event EventHandler<EventArgs> EmployeeUpdate;
        event EventHandler<EventArgs> EmployeeDelete;

        void DisplayMessage(string message);
        void ResetScreen();

        List<Employee> employeeList { get; set; }
        ResponseStatus response { get; set; }
        Employee employee { get; set; }

    }
}

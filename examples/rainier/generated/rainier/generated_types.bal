// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for rainier.
// It should not be modified by hand.

import ballerina/time;

public type Building record {|
    readonly string buildingCode;
    string city;
    string state;
    string country;
    string postalCode;
|};

public type BuildingInsert Building;

public type BuildingUpdate record {|
    string city?;
    string state?;
    string country?;
    string postalCode?;
|};

public type Workspace record {|
    readonly string workspaceId;
    string workspaceType;
    string buildingBuildingCode;
    string employeeEmpNo;
|};

public type WorkspaceInsert Workspace;

public type WorkspaceUpdate record {|
    string workspaceType?;
    string buildingBuildingCode?;
    string employeeEmpNo?;
|};

public type Department record {|
    readonly string deptNo;
    string deptName;
|};

public type DepartmentInsert Department;

public type DepartmentUpdate record {|
    string deptName?;
|};

public type Employee record {|
    readonly string empNo;
    string firstName;
    string lastName;
    time:Date birthDate;
    string gender;
    time:Date hireDate;
    string departmentDeptNo;
|};

public type EmployeeInsert Employee;

public type EmployeeUpdate record {|
    string firstName?;
    string lastName?;
    time:Date birthDate?;
    string gender?;
    time:Date hireDate?;
    string departmentDeptNo?;
|};

public type OrderItem record {|
    readonly string orderId;
    readonly string itemId;
    int quantity;
    string notes;
|};

public type OrderItemInsert OrderItem;

public type OrderItemUpdate record {|
    int quantity?;
    string notes?;
|};


// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;
import foo/association.rainier;

public function main() returns error? {
    rainier:RainierClient rClient = check new ();

    rainier:BuildingInsert item = {
        buildingCode: "1",
        city: "san diego",
        state: "california",
        country: "USA",
        postalCode: "00001"
    };
    String[] buildingIds = check rClient->/building.post([item]);
    io:println("Created building id: ", buildingIds[0]);

    rainier:Building retrievedItem = check rClient->/building/[buildingIds[0]].get();
    io:println("Retrieved item: ", retrievedItem);

    rainier:Building|error itemError = rClient->/building/[5].get();
    io:println("Retrieved non-existence item: ", itemError);

    rainier:BuildingInsert item2 = {
        buildingCode: "2",
        city: "Los Angeles",
        state: "california",
        country: "USA",
        postalCode: "000100"
    };
    rainier:BuildingInsert item3 = {
        buildingCode: "3",
        city: "Blacksburg",
        state: "Virginia",
        country: "USA",
        postalCode: "040000"
    };
    rainier:BuildingInsert item4 = {
        buildingCode: "4",
        city: "Tempe",
        state: "Arizona",
        country: "USA",
        postalCode: "002000"
    };
    _ = check rClient->/building.post([item2, item3, item4]);


    rainier:WorkspaceInsert work1 = {
        workspaceId: "1",
        workspaceType: "cafe",
        buildingBuildingCode: "1",
        employeeEmpNo: "1"
    };

    String[] workspaceIds = check rClient->/workspace.post([work1]);
    io:println("Created building id: ", workspaceIds[0]);

    rainier:Workspace retrievedItem = check rClient->/workspace/[workspaceIds[0]].get();
    io:println("Retrieved item: ", retrievedItem);

    rainier:Workspace|error itemError = rClient->/workspace/[5].get();
    io:println("Retrieved non-existence item: ", itemError);

    rainier:WorkspaceInsert work2 = {
        workspaceId: "2",
        workspaceType: "office",
        buildingBuildingCode: "2",
        employeeEmpNo: "2"
    };

    rainier:WorkspaceInsert work3 = {
        workspaceId: "3",
        workspaceType: "gym",
        buildingBuildingCode: "3",
        employeeEmpNo: "3"
    };
    _ = check rClient->/workspace.post([work2, work3]);




    rainier:DepartmentInsert dep1 = {
        deptNo: "1",
        deptName: "legal"
    };

    String[] deptIds = check rClient->/department.post([dep1]);
    io:println("Created building id: ", deptIds[0]);

    rainier:Workspace retrievedItem = check rClient->/department/[deptIds[0]].get();
    io:println("Retrieved item: ", retrievedItem);

    rainier:Workspace|error itemError = rClient->/department/[5].get();
    io:println("Retrieved non-existence item: ", itemError);

    rainier:DepartmentInsert dep2 = {
        deptNo: "2",
        deptName: "hr"
    };
    rainier:DepartmentInsert dep3 = {
        deptNo: "3",
        deptName: "engineering"
    };
    _ = check rClient->/workspace.post([dep2, dep3]);



    rainier:EmployeeInsert emp1 = {
        empNo: "1",
        firstName: "John",
        lastName: "Smith",
        birthDate: {year: 1992, month: 11, day:13},
        gender: "M",
        hireDate: {year: 2010, month: 11, day:13},
        departmentDeptNo: "1"
    };

    String[] employeeIds = check rClient->/employee.post([dep1]);
    io:println("Created building id: ", employeeIds[0]);

    rainier:Employee retrievedItem = check rClient->/employee/[employeeIds[0]].get();
    io:println("Retrieved item: ", retrievedItem);

    rainier:Employee|error itemError = rClient->/employee/[5].get();
    io:println("Retrieved non-existence item: ", itemError);

    rainier:EmployeeInsert emp2 = {
        empNo: "2",
        firstName: "John",
        lastName: "Peters",
        birthDate: {year: 1996, month: 11, day:13},
        gender: "M",
        hireDate: {year: 2020, month: 11, day:13},
        departmentDeptNo: "2"
    };
    rainier:EmployeeInsert emp3 = {
        empNo: "3",
        firstName: "jake",
        lastName: "Peters",
        birthDate: {year: 2000, month: 11, day:13},
        gender: "M",
        hireDate: {year: 2021, month: 11, day:13},
        departmentDeptNo: "2"
    };


    _ = check rClient->/employee.post([emp2, emp3]);




}


import ballerina/persist;

@persist:Entity {
    key: ["id"],
    tableName: "Companies"
}
public type Company record {|
    readonly int id;
    string name;
    Employee[] employee?;
|};

@persist:Entity {
    key: ["id"],
    tableName: "Employees"
}
public type Employee record {|
    readonly int id;
    string name;

    @persist:Relation {reference: ["id"]}
    Company company?;

    Vehicle[] vehicles?;
|};

@persist:Entity {
    key: ["model"],
    tableName: "Vehicles"
}
public type Vehicle record {|
    readonly int model;
    string name;

    @persist:Relation {keyColumns: ["employeeId"]}
    Employee employee?;
|};


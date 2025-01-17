// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for entities1.
// It should not be modified by hand.

import ballerina/persist;
import ballerina/sql;
import ballerinax/mysql;

const MULTIPLE_ASSOCIATIONS = "multipleassociations";
const PROFILE = "profile";

public client class Entities1Client {
    *persist:AbstractPersistClient;

    private final mysql:Client dbClient;

    private final map<persist:SQLClient> persistClients;

    private final record {|persist:Metadata...;|} metadata = {
        "multipleassociations": {
            entityName: "MultipleAssociations",
            tableName: `MultipleAssociations`,
            fieldMetadata: {
                id: {columnName: "id", 'type: int},
                name: {columnName: "name", 'type: string},
                profileId: {columnName: "profileId", 'type: int}
            },
            keyFields: ["id"]
        },
        "profile": {
            entityName: "Profile",
            tableName: `Profile`,
            fieldMetadata: {
                id: {columnName: "id", 'type: int},
                name: {columnName: "name", 'type: string}
            },
            keyFields: ["id"]
        }
    };

    public function init() returns persist:Error? {
        mysql:Client|error dbClient = new (host = host, user = user, password = password, database = database, port = port);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            multipleassociations: check new (self.dbClient, self.metadata.get(MULTIPLE_ASSOCIATIONS)),
            profile: check new (self.dbClient, self.metadata.get(PROFILE))
        };
    }

    isolated resource function get multipleassociations() returns stream<MultipleAssociations, persist:Error?> {
        stream<record {}, sql:Error?>|persist:Error result = self.persistClients.get(MULTIPLE_ASSOCIATIONS).runReadQuery(MultipleAssociations);
        if result is persist:Error {
            return new stream<MultipleAssociations, persist:Error?>(new MultipleAssociationsStream((), result));
        } else {
            return new stream<MultipleAssociations, persist:Error?>(new MultipleAssociationsStream(result));
        }
    }

    isolated resource function get multipleassociations/[int id]() returns MultipleAssociations|persist:Error {
        MultipleAssociations|error result = (check self.persistClients.get(MULTIPLE_ASSOCIATIONS).runReadByKeyQuery(MultipleAssociations, id)).cloneWithType(MultipleAssociations);
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }

    isolated resource function post multipleassociations(MultipleAssociationsInsert[] data) returns int[]|persist:Error {
        _ = check self.persistClients.get(MULTIPLE_ASSOCIATIONS).runBatchInsertQuery(data);
        return from MultipleAssociationsInsert inserted in data
            select inserted.id;
    }

    isolated resource function put multipleassociations/[int id](MultipleAssociationsUpdate value) returns MultipleAssociations|persist:Error {
        _ = check self.persistClients.get(MULTIPLE_ASSOCIATIONS).runUpdateQuery({"id": id}, value);
        return self->/multipleassociations/[id].get();
    }

    isolated resource function delete multipleassociations/[int id]() returns MultipleAssociations|persist:Error {
        MultipleAssociations result = check self->/multipleassociations/[id].get();
        _ = check self.persistClients.get(MULTIPLE_ASSOCIATIONS).runDeleteQuery({"id": id});
        return result;
    }

    isolated resource function get profile() returns stream<Profile, persist:Error?> {
        stream<record {}, sql:Error?>|persist:Error result = self.persistClients.get(PROFILE).runReadQuery(Profile);
        if result is persist:Error {
            return new stream<Profile, persist:Error?>(new ProfileStream((), result));
        } else {
            return new stream<Profile, persist:Error?>(new ProfileStream(result));
        }
    }

    isolated resource function get profile/[int id]() returns Profile|persist:Error {
        Profile|error result = (check self.persistClients.get(PROFILE).runReadByKeyQuery(Profile, id)).cloneWithType(Profile);
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }

    isolated resource function post profile(ProfileInsert[] data) returns int[]|persist:Error {
        _ = check self.persistClients.get(PROFILE).runBatchInsertQuery(data);
        return from ProfileInsert inserted in data
            select inserted.id;
    }

    isolated resource function put profile/[int id](ProfileUpdate value) returns Profile|persist:Error {
        _ = check self.persistClients.get(PROFILE).runUpdateQuery({"id": id}, value);
        return self->/profile/[id].get();
    }

    isolated resource function delete profile/[int id]() returns Profile|persist:Error {
        Profile result = check self->/profile/[id].get();
        _ = check self.persistClients.get(PROFILE).runDeleteQuery({"id": id});
        return result;
    }

    public function close() returns persist:Error? {
        error? result = self.dbClient.close();
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }
}

public class MultipleAssociationsStream {

    private stream<anydata, sql:Error?>? anydataStream;
    private persist:Error? err;

    public isolated function init(stream<anydata, sql:Error?>? anydataStream, persist:Error? err = ()) {
        self.anydataStream = anydataStream;
        self.err = err;
    }

    public isolated function next() returns record {|MultipleAssociations value;|}|persist:Error? {
        if self.err is persist:Error {
            return <persist:Error>self.err;
        } else if self.anydataStream is stream<anydata, sql:Error?> {
            var anydataStream = <stream<anydata, sql:Error?>>self.anydataStream;
            var streamValue = anydataStream.next();
            if streamValue is () {
                return streamValue;
            } else if (streamValue is sql:Error) {
                return <persist:Error>error(streamValue.message());
            } else {
                MultipleAssociations|error value = streamValue.value.cloneWithType(MultipleAssociations);
                if value is error {
                    return <persist:Error>error(value.message());
                }
                record {|MultipleAssociations value;|} nextRecord = {value: value};
                return nextRecord;
            }
        } else {
            return ();
        }
    }

    public isolated function close() returns persist:Error? {
        check persist:closeEntityStream(self.anydataStream);
    }
}

public class ProfileStream {

    private stream<anydata, sql:Error?>? anydataStream;
    private persist:Error? err;

    public isolated function init(stream<anydata, sql:Error?>? anydataStream, persist:Error? err = ()) {
        self.anydataStream = anydataStream;
        self.err = err;
    }

    public isolated function next() returns record {|Profile value;|}|persist:Error? {
        if self.err is persist:Error {
            return <persist:Error>self.err;
        } else if self.anydataStream is stream<anydata, sql:Error?> {
            var anydataStream = <stream<anydata, sql:Error?>>self.anydataStream;
            var streamValue = anydataStream.next();
            if streamValue is () {
                return streamValue;
            } else if (streamValue is sql:Error) {
                return <persist:Error>error(streamValue.message());
            } else {
                Profile|error value = streamValue.value.cloneWithType(Profile);
                if value is error {
                    return <persist:Error>error(value.message());
                }
                record {|Profile value;|} nextRecord = {value: value};
                return nextRecord;
            }
        } else {
            return ();
        }
    }

    public isolated function close() returns persist:Error? {
        check persist:closeEntityStream(self.anydataStream);
    }
}


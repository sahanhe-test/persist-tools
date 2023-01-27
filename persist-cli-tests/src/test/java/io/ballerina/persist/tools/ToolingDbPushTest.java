/*
 *  Copyright (c) 2022, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 *  WSO2 Inc. licenses this file to you under the Apache License,
 *  Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */

package io.ballerina.persist.tools;

import io.ballerina.persist.BalException;
import io.ballerina.persist.tools.utils.PersistTable;
import io.ballerina.persist.tools.utils.PersistTableColumn;
import jdk.jfr.Description;
import org.testng.annotations.Test;

import java.util.ArrayList;

import static io.ballerina.persist.tools.utils.DatabaseTestUtils.assertCreateDatabaseTables;
import static io.ballerina.persist.tools.utils.DatabaseTestUtils.assertCreatedDatabaseNegative;
import static io.ballerina.persist.tools.utils.GeneratedSourcesTestUtils.Command.DB_PUSH;
import static io.ballerina.persist.tools.utils.GeneratedSourcesTestUtils.assertGeneratedSources;
import static io.ballerina.persist.tools.utils.GeneratedSourcesTestUtils.assertGeneratedSourcesNegative;

/**
 * persist tool db push command tests.
 */
public class ToolingDbPushTest {

    private static final String sqlInt = "INT";
    private static final String sqlVarchar = "VARCHAR";
    private static final String yes = "YES";
    private static final String no = "NO";
    private static final String sqlDateTime = "DATETIME";

    @Test(enabled = true)
    @Description("Database is not available and it is created while running the db push command")
    public void testDbPushWithoutDatabase() throws BalException {
        ArrayList<PersistTable> tables = new ArrayList<>();
        tables.add(
                new PersistTable("MedicalNeed", "needId")
                        .addColumn(new PersistTableColumn("needId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("itemId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("beneficiaryId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("period", sqlDateTime, no, no))
                        .addColumn(new PersistTableColumn("urgency", sqlVarchar, no, no))
                        .addColumn(new PersistTableColumn("quantity", sqlInt, no, no))
        );
        tables.add(
                new PersistTable("MedicalItem", "itemId")
                        .addColumn(new PersistTableColumn("itemId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("name", sqlVarchar, no, no))
                        .addColumn(new PersistTableColumn("type", sqlVarchar, no, no))
                        .addColumn(new PersistTableColumn("unit", sqlVarchar, no, no))
        );
        assertGeneratedSources("tool_test_db_push_1", DB_PUSH);
        assertCreateDatabaseTables("tool_test_db_push_1", "entities", tables);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed outside a Ballerina project")
    public void testDbPushOutsideBallerinaProject() {
        assertGeneratedSourcesNegative("tool_test_db_push_2", DB_PUSH, null);
    }

    @Test(enabled = true, dependsOnMethods = { "testDbPushWithoutDatabase" })
    @Description("Database already exists. An entity is removed. The database tables should not be affected.")
    public void testDbPushEntityRemoved() throws BalException {
        ArrayList<PersistTable> tables = new ArrayList<>();
        tables.add(
                new PersistTable("MedicalNeed", "needId")
                        .addColumn(new PersistTableColumn("needId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("itemId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("beneficiaryId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("period", sqlDateTime, no, no))
                        .addColumn(new PersistTableColumn("urgency", sqlVarchar, no, no))
                        .addColumn(new PersistTableColumn("quantity", sqlInt, no, no))
        );
        tables.add(
                new PersistTable("MedicalItem", "itemId")
                        .addColumn(new PersistTableColumn("itemId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("name", sqlVarchar, no, no))
                        .addColumn(new PersistTableColumn("type", sqlVarchar, no, no))
                        .addColumn(new PersistTableColumn("unit", sqlVarchar, no, no))
        );
        assertGeneratedSources("tool_test_db_push_3", DB_PUSH);
        assertCreateDatabaseTables("tool_test_db_push_3", "entities", tables);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed with empty schema file")
    public void testDbPushEmptySchemaFile() {
        assertGeneratedSources("tool_test_db_push_4", DB_PUSH);
    }

    @Test(enabled = true, dependsOnMethods = { "testDbPushEntityRemoved" })
    @Description("Database already exists. An entity is updated. The respective table should be updated.")
    public void testDbPushEntityUpdated() throws BalException {
        ArrayList<PersistTable> tables = new ArrayList<>();
        tables.add(
                new PersistTable("MedicalNeed", "fooNeedId")
                        .addColumn(new PersistTableColumn("fooNeedId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("fooItemId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("fooBeneficiaryId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("period", sqlDateTime, no, no))
                        .addColumn(new PersistTableColumn("urgency", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("foo", sqlInt, no, no))
        );
        tables.add(
                new PersistTable("MedicalItem", "itemId")
                        .addColumn(new PersistTableColumn("itemId", sqlInt, no, no))
                        .addColumn(new PersistTableColumn("name", sqlVarchar, no, no))
                        .addColumn(new PersistTableColumn("type", sqlVarchar, no, no))
                        .addColumn(new PersistTableColumn("unit", sqlVarchar, no, no))
        );
        assertGeneratedSources("tool_test_db_push_5", DB_PUSH);
        assertCreateDatabaseTables("tool_test_db_push_5", "entities", tables);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed without the persist dir")
    public void testDbPushWithoutPersistDir() {
        assertGeneratedSourcesNegative("tool_test_db_push_6", DB_PUSH, null);
    }

    @Test(enabled = true, dependsOnMethods = { "testDbPushEntityUpdated" })
    @Description("When the db push command is executed with faulty credentials")
    public void testDbPushWithWrongCredentials() {
        assertGeneratedSourcesNegative("tool_test_db_push_7", DB_PUSH, null);
    }

    @Test(enabled = true)
    @Description("Test the created sql script content when relation annotation hasn't properties")
    public void testDbPush() {
        assertGeneratedSources("tool_test_db_push_8", DB_PUSH);
    }

    @Test(enabled = true)
    @Description("Test the created sql script content with out defining any schema files inside persist directory")
    public void testDbPushWithoutSchemaFile() {
        assertGeneratedSources("tool_test_db_push_9", DB_PUSH);
    }

    @Test(enabled = true)
    @Description("Test DB push without specifying DB driver in database_configurations")
    public void testDbPushWithoutDriverImport() {
        assertGeneratedSources("tool_test_db_push_10", DB_PUSH);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed with faulty database name containing illegal characters.")
    public void testDbPushWithIllegalCredentials() {
        assertGeneratedSourcesNegative("tool_test_db_push_11", DB_PUSH, null);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed with faulty database name containing illegal characters.")
    public void testDbPushWithIllegalCredentials2() {
        assertGeneratedSourcesNegative("tool_test_db_push_12", DB_PUSH, null);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed with faulty database name containing illegal characters.")
    public void testDbPushWithIllegalCredentials3() {
        assertGeneratedSourcesNegative("tool_test_db_push_13", DB_PUSH, null);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed with empty database name.")
    public void testDbPushWithEmptyCredentials() {
        assertGeneratedSourcesNegative("tool_test_db_push_14", DB_PUSH, null);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed with faulty clients.")
    public void testDbPushWithInvalidSchemaFile() throws BalException {
        assertGeneratedSourcesNegative("tool_test_db_push_15", DB_PUSH, null);
        assertCreatedDatabaseNegative("tool_test_db_push_15", "entities");
    }

    @Test(enabled = true)
    @Description("Test the created sql script with one to many relation entity")
    public void testDbPushWithOneToManyRelationship() {
        assertGeneratedSources("tool_test_db_push_16", DB_PUSH);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed with invalid config key in Ballerina.toml.")
    public void testDbPushWithInvalidConfigKey() {
        assertGeneratedSourcesNegative("tool_test_db_push_17", DB_PUSH, null);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed with faulty database name containing illegal characters.")
    public void testDbPushWithExceedMaxDBNameLength() {
        assertGeneratedSourcesNegative("tool_test_db_push_18", DB_PUSH, null);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed with incorrect DB Config key without provider.")
    public void testDbPushConfigWithoutProvider() {
        assertGeneratedSourcesNegative("tool_test_db_push_19", DB_PUSH, null);
    }

    @Test(enabled = true)
    @Description("When the db push command is executed with incorrect DB Config.")
    public void testDbPushWithIncorrectDBConfigKey() {
        assertGeneratedSourcesNegative("tool_test_db_push_20", DB_PUSH, null);
    }

    @Test(enabled = true)
    @Description("Test the created sql script with optional type fields")
    public void testDbPushWithOptionalTypeFields() {
        assertGeneratedSources("tool_test_db_push_21", DB_PUSH);
    }

    @Test(enabled = true)
    @Description("Test the created sql script with composite reference keys")
    public void testDbPushWithCompositeReferenceKeys() {
        assertGeneratedSources("tool_test_db_push_22", DB_PUSH);
    }
}

// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/persist as _;

public type MedicalNeed record {|
    readonly int needId;

    @persist:Relation
    MedicalItem item?;

    int beneficiaryId;
    time:Civil period;
    string urgency;
    int quantity;
|};

public type MedicalItem record {|
    readonly int itemId = -1;

    string name;
    string 'type;
    string unit;
|};

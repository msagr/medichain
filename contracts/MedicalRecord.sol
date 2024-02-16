// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract MedicalRecord{

    uint public recordId;
    mapping(uint => Record) records;
    mapping(uint => bool) public isDeleted;

    struct Record{
        uint recordId;
        uint timestamp;
        string name;
        uint age;
        string gender;
        string bloodType;
        string allergies;
        string diagnosis;
        string treatment;
    }

    event MedicalRecord_DeleteRecord(
        uint recordId, 
        uint256 timestamp, 
        string name, 
        uint age, 
        string gender, 
        string bloodType, 
        string allergies, 
        string diagnosis, 
        string treatment
    );

    event MedicalRecord_AddRecord(
        uint recordId, 
        uint256 timestamp, 
        string name, 
        uint age, 
        string gender, 
        string bloodType, 
        string allergies, 
        string diagnosis, 
        string treatment
    );

    function addRecord(
        string memory _name, 
        uint _age, 
        string memory _gender, 
        string memory _bloodType, 
        string memory _allergies,
        string memory _diagnosis,
        string memory _treatment
    ) public {
        recordId++;
        records[recordId] = Record(
            recordId, 
            block.timestamp, 
            _name, 
            _age, 
            _gender, 
            _bloodType, 
            _allergies, 
            _diagnosis,
            _treatment
        );
        emit MedicalRecord_AddRecord(
            recordId,
            block.timestamp,
            _name,
            _age,
            _gender,
            _bloodType,
            _allergies,
            _diagnosis,
            _treatment
        );
    }

    function deleteRecord(uint256 _recordId) public {
        require(!isDeleted[_recordId], "The record id already deleted");
        Record storage record = records[_recordId];
        emit MedicalRecord_DeleteRecord(
            record.recordId, 
            block.timestamp, 
            record.name,
            record.age, 
            record.gender, 
            record.bloodType, 
            record.allergies, 
            record.diagnosis,
            record.treatment
        );
        isDeleted[_recordId] = true;
    }
}

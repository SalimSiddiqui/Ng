﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
   <script src="Scripts/angular.min.js" type="text/javascript"></script>
    <script src="Scripts/js/Crud.js" type="text/javascript"></script>
 

    <style>
        table, th, td
        {
            border: 1px solid grey;
            border-collapse: collapse;
            padding: 5px;
        }
        table th
        {
            background-color: #274257;
            color: #fff;
        }
        table tr:nth-child(odd)
        {
            background-color: #f1f1f1;
        }
        table tr:nth-child(even)
        {
            background-color: #ffffff;
        }
    </style>
  <%--  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>--%>
   
</head>
<body>
    <form id="form1" runat="server">
    <div ng-app="myApp" ng-controller="myCntrl">
        <table>
            <tr>
                <td>
                    Student Name :
                </td>
                <td>
                    <input type="text" id="txtStudentName" ng-model="StudentName" />
                    <label id="lbid" ng-model="stuid">{{stuid}}</label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="Save" ng-click="Save(StudentName)" />
                     <input type="button" value="Update" ng-click="Update()" ng-hide="!upshow" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table>
            <thead>
                <tr>
                    <th>
                        StudentID
                    </th>
                    <th>
                        StudentName
                    </th>
                    <th>
                    </th>
                </tr>
            </thead>
            <tr ng-repeat="student in StudentList | orderBy : studentorder ">
                <td ng-bind="student.StudentID">
                {{student.StudentID}}
                </td>
                <td ng-bind="student.StudentName">
                {{student.StudentName}}
                </td>
                <td>
                    <a href="#" ng-click="Delete()">Delete</a>
                </td>
                 <td>
                    <a href="#" ng-click="Select()">Select</a>
                </td>
            </tr>
        </table>
    </div>
    <%--<script>
        var app = angular.module("myApp", []);
        app.controller("myCntrl", function ($scope, $http) {
            $scope.studentorder = "StudetnID";
            $scope.studetnName = "";
            $scope.Save = function () {
                var httpreq = {
                    method: 'POST',
                    url: 'Default.aspx/Save',
                    headers: {
                        'Content-Type': 'application/json; charset=utf-8',
                        'dataType': 'json'
                    },
                    data: { StudentName: $scope.studetnName }
                }
                $http(httpreq).success(function (response) {
                    $scope.fillList();
                    alert("Saved successfully.");
                })
            };
            $scope.Delete = function (SID) {
                if (confirm("Are you sure want to delete?")) {
                    var httpreq = {
                        method: 'POST',
                        url: 'Default.aspx/Delete',
                        headers: {
                            'Content-Type': 'application/json; charset=utf-8',
                            'dataType': 'json'
                        },
                        data: { StudentID: SID }
                    }
                    $http(httpreq).success(function (response) {
                        $scope.fillList();
                        alert("Deleted successfully.");
                    })
                }
            };
            $scope.fillList = function () {
                $scope.studetnName = "";
                var httpreq = {
                    method: 'POST',
                    url: 'Default.aspx/GetList',
                    headers: {
                        'Content-Type': 'application/json; charset=utf-8',
                        'dataType': 'json'
                    },
                    data: {}
                }
                $http(httpreq).success(function (response) {

                    $scope.StudentList = response.d;
                })
            };


            $scope.Select = function (SID) {

                var httpreq = {
                    method: 'POST',
                    url: 'Default.aspx/Select',
                    headers: {
                        'Content-Type': 'application/json; charset=utf-8',
                        'dataType': 'json'
                    },
                    data: { StudentID: SID }
                }
                $http(httpreq).success(function (response) {
                    $scope.studetnName = response.d[0].StudentName;
                    $scope.stuid = response.d[0].StudentID;
                    $scope.upshow = true;

                })

            };



            $scope.Update = function () {
                var httpreq = {
                    method: 'POST',
                    url: 'Default.aspx/Update',
                    headers: {
                        'Content-Type': 'application/json; charset=utf-8',
                        'dataType': 'json'
                    },
                    data: { StudentName: $scope.studetnName, StudentID: $scope.stuid
                    }
                }
                $http(httpreq).success(function (response) {
                    $scope.fillList();
                    $scope.upshow = false;
                    alert("Upate successfully.");
                })
            };


            $scope.fillList();
        });
    </script>--%>
    </form>
</body>
</html>

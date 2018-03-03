pragma solidity ^0.4.17;

contract Datachain{
    address public currentUser;
    
    // Temporary varibales to display in remix
    uint public userid1;
    string public details1;
    string public welcomesurvey1;
    address public user1;
    uint public surveyid2;
    string public resultsetcode2;
    string public qandans2;
    address public user2;
    
    struct Userdata{
        uint userid;
        string details;
        string welcomesurvey;
        address user;
    }
    
    Userdata[] public userdata;
    
    struct Surveydata{
        uint surveyid;
        string resultsetcode;
        string qandans;
        address user;

    }
    
    // Surveydata[] public surveydata;
    mapping(uint256 => Surveydata) surveyd;

    function storeUserdata(uint userid,string details,string welcomesurvey) public{
        currentUser = msg.sender;
        Userdata memory newUserdata = Userdata({
           userid: userid,
           details: details,
           welcomesurvey: welcomesurvey,
           user: currentUser
        });
        userdata.push(newUserdata);
    }
    
    function storeSurveyresults(uint surveyid,string resultsetcode,string qandans) public{
        currentUser = msg.sender;
        var sur = surveyd[surveyid];
        sur.surveyid = surveyid;
        sur.resultsetcode = resultsetcode;
        sur.qandans = qandans;
        sur.user = currentUser;

    }
    
    function getUserdata(uint userid) public{
        Userdata storage user = userdata[userid];
        userid1 = user.userid;
        details1 = user.details;
        welcomesurvey1 = user.welcomesurvey;
        user1 = user.user;
    }
    
    function getSurveyresults(uint surveyid) public {
        var surout = surveyd[surveyid];
        // Surveydata storage survey = surveydata[surveyid];
        surveyid2 = surout.surveyid;
        resultsetcode2 = surout.resultsetcode;
        qandans2 = surout.qandans;
        user2 = surout.user;
      
    }
    
}



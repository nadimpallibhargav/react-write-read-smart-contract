// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {

    // defining the campaign object
    struct Campaign { 
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadlin;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
    }

    // mapping Campaign to access publicly
    mapping(uint256 => Campaign) public campaigns;

    // variable to store total no.of campaigns
    uint256 public numberOfCampaigns = 0;

    // function for creating a campaign
    function createCampaign() {}

    // function for donating to campaign
    function dontateToCampaign() {}

    // function for getting all donators
    function getDonators() {}

    // function for getting all campaigns
    function getCampaigns() {}
}
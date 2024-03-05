// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {

    // defining the campaign object
    struct Campaign { 
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
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
        /* need '_' for defining parameters (ex: _title) */
        /* need 'memory' for defining string parameters */
    function createCampaign(address _owner, string memory _title, string memory _description, uint256 _target, uint256 _deadline, string memory _image) public returns (uint256) {
        
        Campaign storage campaign = campaigns[numberOfCampaigns]; // for updating the number of caompaigns

        // check if the deadline is valid. if the deadline value is in past, show the invalid message        
        require(campaign.deadline < block.timestamp, 'The deadline should be a date in the future.');

        // continue if deadline is valid
        // update the campaign with given params
        campaign.owner = _owner;
        campaign.title = _title;
        campaign.description = _description;
        campaign.target = _target;
        campaign.deadline = _deadline;
        campaign.amountCollected = 0;
        campaign.image = _image;        

        numberOfCampaigns++; // increaments the total campaigns 

        return numberOfCampaigns - 1; // returns the recently added campaign, that is campaigns[campaings.length - 1]

    }

    // function for donating to campaign
    function dontateToCampaign() {}

    // function for getting all donators
    function getDonators() {}

    // function for getting all campaigns
    function getCampaigns() {}
}
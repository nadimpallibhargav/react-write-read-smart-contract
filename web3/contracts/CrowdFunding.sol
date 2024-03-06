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
        
        // for updating the number of campaigns
        Campaign storage campaign = campaigns[numberOfCampaigns]; 

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

        numberOfCampaigns++; 

        return numberOfCampaigns - 1; // returns the recently added campaign, that is campaigns[campaings.length - 1]

    }

    // function for donating to campaign
        /* get id of the campaign to donate */
        /* keyword 'payable' specifies, to send a crycpto currency */
    function dontateToCampaign(uint256 _id) public payable {

        uint256 amount = msg.value; // variable to store the donator amount

        // mapping to the campaigns
        Campaign storage campaign = campaigns[_id]; 

        // add the address of the donator
        campaign.donators.push(msg.sender); 

        // add the donation amount
        campaign.donations.push(amount); 

        // store the status of donation. if sent successfully to owner
            /* payable() returns 2 values. so adding a ',' which states that we are expecting a value */
        (bool sent,) = payable(campaign.owner).call{value: amount}("");

        // if donation sent success. update campaign amount
        if(sent) {
            campaign.amountCollected = campaign.amountCollected + amount;
        }
    }

    // function for getting all donators
    function getDonators() {}

    // function for getting all campaigns
    function getCampaigns() {}
}
pragma solidity ^0.4.11;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(8);

        uint expected = 8;

        Assert.equal(returnedId, expected, "Adoption of pet should be recorded");
    }

    function testGetAdopterAddressByPetId() public {
        address expected = this;

        address adopter = adoption.adopters(8);

        Assert.equal(adopter, expected, "Address of adopter should be recorded");
    }

    function testGetAdopterAddressByPetIdInArray() public {
        address expected = this;

        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[8], expected, "Address of adopter should be recorded in array");
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

contract FlowControl {

  function calcDozenDiscountIF(uint purchasedQty) private pure returns (bool) {
    bool giveDozenPrice = false;
    if (purchasedQty >= 12) {
      giveDozenPrice = true;
    }
    else {
      giveDozenPrice = false;
    }
    return (giveDozenPrice);
  }

  function calcDozenDiscountWHILE(uint purchasedQty) private pure returns (bool) {
    bool giveDozenPrice = false;
    uint numDonuts = 1;
    while (numDonuts < purchasedQty) {
      numDonuts++;
      if (numDonuts >= 12) {
        giveDozenPrice = true;
        break;
      }
    }
    return (giveDozenPrice);
  }

  function calcDozenDiscountDO(uint purchasedQty) private pure returns (bool) {
    bool giveDozenPrice = false;
    uint numDonuts = 1;
    do {
      numDonuts++;
      if (numDonuts >= 12) {
        giveDozenPrice = true;
        break;
      }
    } while (numDonuts < purchasedQty);
    return (giveDozenPrice);
  }

  function calcDozenDiscountFOR(uint purchasedQty) private pure returns (bool) {
    bool giveDozenPrice = false;
    uint numDonuts = 1;
    for (numDonuts = 1; numDonuts <= purchasedQty; numDonuts++) {
      if (numDonuts >= 12) {
        giveDozenPrice = true;
        break;
      }
    }
    return (giveDozenPrice);
  }

}

/*
error handling
revert():
  undoes all state changes
  can send return value to caller (informing the caller why it failed)
  refunds remaining gas to the caller
  indicates a transaction should be terminated before it's completed
assert():
  something bad has happened
  undoes all state changes
  uses all remaing gas
require():
  checks for requirements before invoking function
  undoes state changes
  sends return value
  refunds all remaining gas
*/

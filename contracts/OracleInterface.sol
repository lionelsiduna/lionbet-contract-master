// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

/**
 * @title The interface for the events Oracle (`BetOracle`)
 * @notice Declares the functions that the `BetOracle` contract exposes externally
 */
interface OracleInterface {


    enum EventOutcome {
        Pending,    //match has not been fought to decision
        Underway,   //match has started & is underway
        Draw,       //anything other than a clear winner (e.g. cancelled)
        Decided     //index of participant who is the winner
    }

    enum SportKind {
        Soccer,
        Rugby,
        Basketball
    }

    function eventExists(bytes32 _eventId)
        external view returns (bool);

    function getPendingEvents()
        external view returns (bytes32[] memory);

    function getAllSportEvents()
        external view returns (bytes32[] memory);

    function getEvent(bytes32 _eventId)
        external view returns (
            bytes32       id,
            string memory name,
            string memory participants,
            uint8         participantCount,
            uint          date,
            SportKind     kind,
            EventOutcome  outcome,
            int8          winner
        );

    function getLatestEvent(bool _pending)
        external view returns (
            bytes32       id,
            string memory name,
            string memory participants,
            uint8          participantCount,
            uint          date,
            SportKind     kind,
            EventOutcome  outcome,
            int8          winner
        );

    function testConnection()
        external pure returns (bool);

}

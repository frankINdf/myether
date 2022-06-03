// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;
contract SimpleStorage{
    // 加public才在外可见
    uint256  public favoriteNumber;
    // 定义结构体
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    //结构体数组
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    // uint256无需声明memory, array,struct,mapping需要用memory 
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }
    // 后面必须加memory, 为什么要用memory
    //当外部函数对某合约调用完成时，内存型变量即被移除。状态变量-storage;函数内部声明的变量-memory
    function retrieve_person()  public  view  returns (People[] memory){
        return people;
    }
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

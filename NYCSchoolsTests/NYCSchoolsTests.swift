//
//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by Suresh kumar Vijayakumar on 2/1/24.
//

import XCTest
@testable import NYCSchools

final class NYCSchoolsTests: XCTestCase {
    let viewModel = ViewModel(manager: MockServiceManaging())
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSchoolName() {
       /// when
        viewModel.fetchSchools()
        
        ///then
        XCTAssertTrue(viewModel.schools?.first?.school_name == "firstschool")
    }
}

struct MockServiceManaging: ServiceManaging {
    func fetch(completion: @escaping (Result<[NYCSchools.NycSchool], Error>) -> ()) {
        let school = NycSchool(dbn: "dbn", school_name: "firstschool", boro: "", overview_paragraph: "", school_10th_seats: "", academicopportunities1: "", academicopportunities2: "", ell_programs: "", neighborhood: "", building_code: "", location: "", phone_number: "", fax_number: "", school_email: "", website: "", subway: "", bus: "", grades2018: "", finalgrades: "", total_students: "", extracurricular_activities: "", school_sports: "", attendance_rate: "", pct_stu_enough_variety: "", pct_stu_safe: "", school_accessibility_description: "", directions1: "", requirement1_1: "", requirement2_1: "", requirement3_1: "", requirement4_1: "", requirement5_1: "", offer_rate1: "", program1: "", code1: "", interest1: "", method1: "", seats9ge1: "", grade9gefilledflag1: "", grade9geapplicants1: "", seats9swd1: "", grade9swdfilledflag1: "", grade9swdapplicants1: "", seats101: "", admissionspriority11: "", admissionspriority21: "", admissionspriority31: "", grade9geapplicantsperseat1: "", grade9swdapplicantsperseat1: "", primary_address_line_1: "", city: "", zip: "", state_code: "", latitude: "", longitude: "", community_board: "", council_district: "", census_tract: "", bin: "", bbl: "", nta: "", borough: "")
        completion(Result.success([school]))
    }
}

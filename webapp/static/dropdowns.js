/*
SELECT concat(", code, ": ", name, ",) AS js
FROM college  -- or department
ORDER BY code
*/

const colleges = {
    "CAL": "College of Arts and Letters",
    "CHBS": "College of Health and Behavioral Studies",
    "CISE": "College of Integrated Science and Engineering",
    "COB": "College of Business",
    "COE": "College of Education",
    "CSM": "College of Science and Mathematics",
    "CVPA": "College of Visual and Performing Arts",
    "GRAD": "The Graduate School",
    "HON": "Honors College",
    "LIB": "Libraries",
    "PCE": "School of Professional and Continuing Education",
    "UNST": "University Studies",
}

const departments = {
    "ACENG": "Academic Engagement",
    "ACTG": "School of Accounting",
    "ADP": "Adult Degree Program",
    "ART": "School of Art, Design and Art History",
    "BIO": "Department of Biology",
    "CHEM": "Department of Chemistry and Biochemistry",
    "CIS": "Department of Computer Information Systems & Business Analytics",
    "CS": "Department of Computer Science",
    "CSD": "Department of Communication Sciences and Disorders",
    "DANC": "School of Theatre and Dance – Dance",
    "DATECH": "Discovery, Access and Technology",
    "ECON": "Department of Economics",
    "EERE": "Department of Early, Elementary and Reading Education",
    "EFEX": "Department of Educational Foundations and Exceptionalities",
    "ENG": "Department of English",
    "ENGR": "Department of Engineering",
    "FIN": "Department of Finance and Business Law",
    "FLAN": "Department of Foreign Languages, Literatures and Cultures",
    "GEOG": "School of Integrated Sciences – Geography",
    "GEOL": "Department of Geology and Environmental Science",
    "HIST": "Department of History",
    "HM": "Hart School of Hospitality, Sport and Recreation Management",
    "HTH": "Department of Health Sciences",
    "HTHP": "Department of Health Professions",
    "IA": "School of Integrated Sciences – Information Analysis",
    "IB": "Department of International Business",
    "IDLS": "Interdisciplinary Liberal Studies",
    "ISAT": "School of Integrated Sciences – Integrated Science & Technology",
    "JUST": "Department of Justice Studies",
    "KIN": "Department of Kinesiology",
    "LEAD": "School of Strategic Leadership Studies",
    "LIBADM": "Libraries Administration",
    "LID": "Learning Innovations and Design",
    "LTLE": "Department of Learning, Technology and Leadership Education",
    "MATH": "Department of Mathematics and Statistics",
    "MGT": "Department of Management",
    "MKTG": "Department of Marketing",
    "MSCI": "Department of Military Science",
    "MSME": "Department of Middle, Secondary and Mathematics Education",
    "MUS": "School of Music",
    "NSG": "School of Nursing",
    "PHIL": "Department of Philosophy and Religion",
    "PHYS": "Department of Physics and Astronomy",
    "POSC": "Department of Political Science",
    "PSYC": "Department of Psychology",
    "PSYC2": "Department of Graduate Psychology",
    "SCOM": "School of Communication Studies",
    "SMAD": "School of Media Arts and Design",
    "SOCI": "Department of Sociology and Anthropology",
    "SOWK": "Department of Social Work",
    "THEA": "School of Theatre and Dance – Theater",
    "WRTC": "School of Writing, Rhetoric and Technical Communication",
}

/**
 * Populates a <select> element with one of the objects above.
 *
 * @param {string} id - The ID of the <select> element to populate.
 * @param {Object} data - Key-value pairs representing each <option>.
 * @param {string} value - The currently selected value (or "None").
 */
function init_select(id, data, value) {
    const select = document.getElementById(id);
    for (const [code, name] of Object.entries(data)) {
        const option = document.createElement("option");
        option.value = code;
        option.text = code + ": " + name;
        select.appendChild(option);
    }
    if (value !== "None") {
        select.value = value;
    }
}

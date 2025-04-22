<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blood Dono Admin Dashboard</title>

    <!-- Google Fonts -->
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Bodoni+Moda:ital,wght@0,400;1,400&family=Montserrat:wght@500&display=swap");
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap");

      :root {
        --red: #d32f2f;
        --light-green: #a5d6a7;
        --bg-light: #fdfcfc;
        --text: #2e2e2e;
        --card-bg: #ffffff;
        --table-header: #c62828;
        --table-row-alt: #f9f9f9;
        --border: #e0e0e0;
        --button-bg: #66bb6a;
        --highlight: #ffeaea;
        --popup-bg: rgba(0, 0, 0, 0.5);
        --popup-box-bg: #f8dcdc;
      }

      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

      body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(to bottom right, #fff5f5, #fff);
        color: var(--text);
      }
      /* Navigation */
nav {
  display: flex;
  justify-content: center;
  position: fixed;
  width: 100%;
  top: 0;
  left: 0;
  z-index: 999;
}

.nav {
  width: 80vw;
  height: 3.5em;
  background-color: #fff;
  border-radius: 50em;
  margin-top: 1em;
  box-shadow: 0 2px 10px #0000001e;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 2em;
  font-size: 0.9rem;
}

.nav .logo {
  display: flex;
  align-items: center;
  font-weight: bold;
  font-size: 1.1rem;
  color: #000;
  text-decoration: none;
}

.nav .logo div {
  width: 10px;
  height: 10px;
  background-color: #c0392b;
  border-radius: 50%;
  margin-right: 0.5em;
}

.nav ul {
  display: flex;
  gap: 1.5em;
  list-style: none;
}

.nav ul li {
  position: relative;
  cursor: pointer;
}

.nav ul li::after {
  content: '';
  position: absolute;
  width: 100%;
  height: 2px;
  bottom: -4px;
  left: 0;
  background-color: #000;
  transform: scaleX(0);
  transform-origin: bottom right;
  transition: transform 0.25s ease-out;
}

.nav ul li:hover::after,
.nav ul li.selected::after {
  transform: scaleX(1);
  transform-origin: bottom left;
}

      header {
        background-color: var(--red);
        color: white;
        padding: 20px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }

      header h1 {
        font-family: "Bodoni Moda", serif;
        font-size: 1.8rem;
      }

      nav a {
        color: white;
        margin-left: 20px;
        text-decoration: none;
        font-weight: 500;
      }

      .dashboard {
        padding: 40px;
      }

      .greeting {
        font-size: 1.6rem;
        font-weight: bold;
        color: var(--red);
        margin-bottom: 30px;
      }

      .cards {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 24px;
        margin-bottom: 50px;
      }

      .card {
        background: var(--card-bg);
        border-radius: 20px;
        padding: 20px;
        border-left: 6px solid var(--red);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        transition: transform 0.2s;
      }

      .card:hover {
        transform: translateY(-4px);
      }

      .card h3 {
        color: var(--red);
        font-size: 1.2rem;
        margin-bottom: 10px;
      }

      .section {
        margin-bottom: 50px;
      }

      .section-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
      }

      .section-header h2 {
        font-size: 1.4rem;
        color: var(--red);
      }

      .btn-add {
        background-color: var(--button-bg);
        color: white;
        border: none;
        padding: 10px 18px;
        border-radius: 8px;
        cursor: pointer;
        font-weight: 500;
        transition: background-color 0.3s;
      }

      .btn-add:hover {
        background-color: #4caf50;
      }

      table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 12px;
        overflow: hidden;
        background-color: white;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
      }

      th,
      td {
        padding: 14px 16px;
        border-bottom: 1px solid var(--border);
        text-align: center;
      }

      th {
        background-color: var(--table-header);
        color: white;
      }

      tr:nth-child(even) td {
        background-color: var(--table-row-alt);
      }

      .popup,
      .confirm-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: var(--popup-bg);
        justify-content: center;
        align-items: center;
        z-index: 999;
      }

      .popup-box,
      .confirm-box {
        background: var(--popup-box-bg);
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        width: 400px;
        max-width: 100%;
        color: #878787;
        text-align: center;
      }

      .popup h3,
      .confirm-box h3 {
        margin-bottom: 20px;
        color: var(--red);
      }

      .popup input,
      .popup textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 8px;
        border: 1px solid var(--border);
        font-size: 1rem;
        background-color: #e9fff0;
      }

      .btn-submit,
      .btn-close,
      .btn-confirm,
      .btn-cancel {
        padding: 12px;
        font-weight: 600;
        border-radius: 8px;
        cursor: pointer;
        margin: 5px;
        width: 45%;
      }

      .btn-submit {
        background-color: var(--button-bg);
        color: white;
        border: none;
      }

      .btn-close,
      .btn-cancel {
        background-color: var(--red);
        color: white;
        border: none;
      }

      .btn-confirm {
        background-color: var(--button-bg);
        color: white;
        border: none;
      }
    </style>
  </head>
  <body>
    <nav>
        <div class="nav">
          <a href="#" class="logo"><div></div> Blood Dono</a>
          <ul>
            <li>Home</li>
            <li>About</li>
            <li>Campaign</li>
            <li>Blog</li>
            <li>Contact</li>
            <li class="selected">Admin </li>
          </ul>
        </div>
      </nav>
  </header>

  <div class="dashboard">
    <div class="greeting" style="padding-top: 30px;">Hi Admin 👋</div>

    <div class="cards">
      <div class="card">
        <h3>Total Donors</h3>
        <p>340</p>
      </div>
      <div class="card">
        <h3>Total Receivers</h3>
        <p>2040</p>
      </div>
      <div class="card">
        <h3>Total Users</h3>
        <p>825</p>
      </div>
      <div class="card">
        <h3>Total Campaigns</h3>
        <p>950</p>
      </div>
    </div>

    <div class="section">
      <div class="section-header">
        <h2>Campaign Details</h2>
        <button class="btn-add" onclick="showPopup('campaign')">
          + Add Campaign
        </button>
      </div>
      <table id="campaign-table">
        <tr>
          <th>Campaign ID</th>
          <th>Campaign Name</th>
          <th>Location</th>
          <th>Date</th>
          <th>Details</th>
          <th>Actions</th>
        </tr>
        <!-- Existing Campaign Data -->
        <tr>
          <td>1</td>
          <td>Save Life Campaign</td>
          <td>New York</td>
          <td>2025-05-01</td>
          <td>Blood donation for cancer patients.</td>
          <td>
            <button onclick="deleteRow(this)">Delete</button>
            <button onclick="editCampaign(this)">Update</button>
          </td>
        </tr>
        <tr>
          <td>2</td>
          <td>Give Hope Campaign</td>
          <td>Los Angeles</td>
          <td>2025-06-01</td>
          <td>Donation drive for heart patients.</td>
          <td>
            <button onclick="deleteRow(this)">Delete</button>
            <button onclick="editCampaign(this)">Update</button>
          </td>
        </tr>
      </table>
    </div>

    <div class="section">
      <div class="section-header">
        <h2>User Details</h2>
        <button class="btn-add" onclick="showPopup('user')">
          + Add User
        </button>
      </div>
      <table id="user-table">
        <tr>
          <th>User ID</th>
          <th>Full Name</th>
          <th>Blood Type</th>
          <th>Phone</th>
          <th>Location</th>
          <th>DOB</th>
          <th>Gender</th>
          <th>Actions</th>
        </tr>
        <!-- Existing User Data -->
        <tr>
          <td>1</td>
          <td>John Doe</td>
          <td>A+</td>
          <td>123-456-7890</td>
          <td>New York</td>
          <td>1990-01-01</td>
          <td>Male</td>
          <td>
            <button onclick="deleteRow(this)">Delete</button>
            <button onclick="editUser(this)">Update</button>
          </td>
        </tr>
        <tr>
          <td>2</td>
          <td>Jane Smith</td>
          <td>O+</td>
          <td>098-765-4321</td>
          <td>Los Angeles</td>
          <td>1985-03-15</td>
          <td>Female</td>
          <td>
            <button onclick="deleteRow(this)">Delete</button>
            <button onclick="editUser(this)">Update</button>
          </td>
        </tr>
      </table>
    </div>
    <div class="section">
      <div class="section-header">
        <h2>Donor Table</h2>
      </div>
      <table>
        <tr>
          <th>User ID</th>
          <th>Donation ID</th>
          <th>Campaign ID</th>
          <th>Donation Date</th>
          <th>Blood Group</th>
          <th>Units Donated</th>
        </tr>
        <tr>
          <td>100001</td>
          <td>D001</td>
          <td>200001</td>
          <td>2025-04-15</td>
          <td>O+</td>
          <td>1</td>
        </tr>
        <tr>
          <td>100002</td>
          <td>D002</td>
          <td>200002</td>
          <td>2025-05-02</td>
          <td>A+</td>
          <td>1</td>
        </tr>
        <tr>
          <td>100003</td>
          <td>D003</td>
          <td>200003</td>
          <td>2025-06-10</td>
          <td>AB-</td>
          <td>2</td>
        </tr>
      </table>
    </div>

    <div class="section">
      <div class="section-header">
        <h2>Request Table</h2>
      </div>
      <table>
        <tr>
          <th>User ID</th>
          <th>Request ID</th>
          <th>Blood Group</th>
          <th>Request Date</th>
          <th>Medical Condition</th>
          <th>Requested Units</th>
          <th>Request Status</th>
        </tr>
        <tr>
          <td>100002</td>
          <td>R001</td>
          <td>B+</td>
          <td>2025-04-17</td>
          <td>Surgery</td>
          <td>2</td>
          <td>Pending</td>
        </tr>
        <tr>
          <td>100003</td>
          <td>R002</td>
          <td>AB-</td>
          <td>2025-06-15</td>
          <td>Accident</td>
          <td>3</td>
          <td>Approved</td>
        </tr>
        <tr>
          <td>100001</td>
          <td>R003</td>
          <td>O+</td>
          <td>2025-07-01</td>
          <td>Delivery</td>
          <td>1</td>
          <td>Rejected</td>
        </tr>
      </table>
    </div>
  </div>
  </div>

    <!-- Popups -->
    <div class="popup" id="popup">
      <div class="popup-box">
        <h3 id="popup-title">Add New</h3>
        <form id="popup-form">
          <input type="text" id="popup-id" placeholder="ID" required />
          <input type="text" id="popup-name" placeholder="Name" required />
          <input
            type="text"
            id="popup-location"
            placeholder="Location"
            required
          />
          <input type="date" id="popup-date" required />
          <textarea
            id="popup-details"
            placeholder="Details"
            required
          ></textarea>
          <button type="submit" class="btn-submit">Submit</button>
          <button type="button" class="btn-close" onclick="closePopup()">
            Close
          </button>
        </form>
      </div>
    </div>

    <div class="confirm-overlay" id="confirm-overlay">
      <div class="confirm-box">
        <h3>Are you sure you want to make changes?</h3>
        <button class="btn-confirm" onclick="confirmEdit(true)">Yes</button>
        <button class="btn-cancel" onclick="confirmEdit(false)">No</button>
      </div>
    </div>

    <script>
      let currentForm = null;
      let editRow = null;

      function showPopup(type, row = null) {
        currentForm = type;
        editRow = row;
        const popup = document.getElementById("popup");
        document.getElementById("popup-form").reset();

        if (row) {
          document.getElementById("popup-id").value = row.cells[0].innerText;
          document.getElementById("popup-name").value = row.cells[1].innerText;
          document.getElementById("popup-location").value =
            row.cells[2].innerText;
          document.getElementById("popup-date").value = row.cells[3].innerText;
          document.getElementById("popup-details").value =
            row.cells[4].innerText;
        }

        document.getElementById("popup-title").innerText =
          type === "campaign" ? "Add/Edit Campaign" : "Add/Edit User";
        popup.style.display = "flex";
      }

      function closePopup() {
        document.getElementById("popup").style.display = "none";
      }

      function confirmEdit(confirmed) {
        document.getElementById("confirm-overlay").style.display = "none";
        if (confirmed) {
          applyEdit();
        }
      }

      function applyEdit() {
        const id = document.getElementById("popup-id").value;
        const name = document.getElementById("popup-name").value;
        const location = document.getElementById("popup-location").value;
        const date = document.getElementById("popup-date").value;
        const details = document.getElementById("popup-details").value;

        if (editRow) {
          editRow.cells[0].innerText = id;
          editRow.cells[1].innerText = name;
          editRow.cells[2].innerText = location;
          editRow.cells[3].innerText = date;
          editRow.cells[4].innerText = details;
        } else {
          const table = document.getElementById(currentForm + "-table");
          const existingIds = Array.from(table.rows)
            .slice(1)
            .map((row) => row.cells[0].innerText);
          if (existingIds.includes(id)) {
            alert("ID must be unique!");
            return;
          }

          const newRow = table.insertRow();
          newRow.innerHTML = `<td>${id}</td><td>${name}</td><td>${location}</td><td>${date}</td><td>${details}</td><td><button onclick="deleteRow(this)">Delete</button> <button onclick="editEntry(this, '${currentForm}')">Update</button></td>`;
        }

        closePopup();
      }

      function deleteRow(button) {
        if (confirm("Are you sure you want to delete this row?")) {
          button.closest("tr").remove();
        }
      }

      function editEntry(button, type) {
        const row = button.closest("tr");
        document.getElementById("popup").style.display = "flex";
        showPopup(type, row);
        document.getElementById("confirm-overlay").style.display = "flex";
      }

      document
        .getElementById("popup-form")
        .addEventListener("submit", function (e) {
          e.preventDefault();
          document.getElementById("confirm-overlay").style.display = "flex";
        });
    </script>
  </body>
</html>

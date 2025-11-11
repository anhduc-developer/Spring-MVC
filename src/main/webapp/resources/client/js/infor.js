document.addEventListener("DOMContentLoaded", () => {
  // Avatar preview
  const avatarUpload = document.getElementById("avatarUpload");
  const avatarPreview = document.getElementById("avatarPreview");

  avatarUpload.addEventListener("change", (event) => {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (e) => (avatarPreview.src = e.target.result);
      reader.readAsDataURL(file);
    }
  });

  // Trường ngày tháng năm
  const daySelect = document.getElementById("day");
  const monthSelect = document.getElementById("month");
  const yearSelect = document.getElementById("year");

  for (let d = 1; d <= 31; d++) {
    const option = document.createElement("option");
    option.value = option.text = String(d).padStart(2, "0");
    daySelect.add(option);
  }

  for (let m = 1; m <= 12; m++) {
    const option = document.createElement("option");
    option.value = option.text = String(m).padStart(2, "0");
    monthSelect.add(option);
  }

  const currentYear = new Date().getFullYear();
  for (let y = currentYear; y >= 1900; y--) {
    const option = document.createElement("option");
    option.value = option.text = y;
    yearSelect.add(option);
  }

  // Update info
  document.getElementById("userInfoForm").addEventListener("submit", (e) => {
    e.preventDefault();
    alert("Thông tin đã được cập nhật (chưa có backend kết nối)");
  });
});
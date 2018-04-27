/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Siti Khusnul Azifah
 */
@Entity
@Table(name = "KARYAWAN")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Karyawan.findAll", query = "SELECT k FROM Karyawan k")
    , @NamedQuery(name = "Karyawan.findByNik", query = "SELECT k FROM Karyawan k WHERE k.nik = :nik")
    , @NamedQuery(name = "Karyawan.findByNama", query = "SELECT k FROM Karyawan k WHERE k.nama = :nama")
    , @NamedQuery(name = "Karyawan.findByAgama", query = "SELECT k FROM Karyawan k WHERE k.agama = :agama")
    , @NamedQuery(name = "Karyawan.findByAlamat", query = "SELECT k FROM Karyawan k WHERE k.alamat = :alamat")
    , @NamedQuery(name = "Karyawan.findByTanggalLahir", query = "SELECT k FROM Karyawan k WHERE k.tanggalLahir = :tanggalLahir")
    , @NamedQuery(name = "Karyawan.findByTglMulaiKerja", query = "SELECT k FROM Karyawan k WHERE k.tglMulaiKerja = :tglMulaiKerja")
    , @NamedQuery(name = "Karyawan.findByJenisKelamin", query = "SELECT k FROM Karyawan k WHERE k.jenisKelamin = :jenisKelamin")
    , @NamedQuery(name = "Karyawan.findBySisaCuti", query = "SELECT k FROM Karyawan k WHERE k.sisaCuti = :sisaCuti")
    , @NamedQuery(name = "Karyawan.findByStatus", query = "SELECT k FROM Karyawan k WHERE k.status = :status")})
public class Karyawan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "NIK")
    private String nik;
    @Column(name = "NAMA")
    private String nama;
    @Column(name = "AGAMA")
    private String agama;
    @Column(name = "ALAMAT")
    private String alamat;
    @Column(name = "TANGGAL_LAHIR")
    @Temporal(TemporalType.TIMESTAMP)
    private Date tanggalLahir;
    @Column(name = "TGL_MULAI_KERJA")
    @Temporal(TemporalType.TIMESTAMP)
    private Date tglMulaiKerja;
    @Column(name = "JENIS_KELAMIN")
    private String jenisKelamin;
    @Column(name = "SISA_CUTI")
    private Short sisaCuti;
    @Column(name = "STATUS")
    private String status;
    @JoinColumn(name = "ID_JABATAN", referencedColumnName = "ID_JABATAN")
    @ManyToOne(fetch = FetchType.LAZY)
    private Jabatan idJabatan;

    public Karyawan() {
    }

    public Karyawan(String nik) {
        this.nik = nik;
    }

    public String getNik() {
        return nik;
    }

    public void setNik(String nik) {
        this.nik = nik;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getAgama() {
        return agama;
    }

    public void setAgama(String agama) {
        this.agama = agama;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public Date getTanggalLahir() {
        return tanggalLahir;
    }

    public void setTanggalLahir(Date tanggalLahir) {
        this.tanggalLahir = tanggalLahir;
    }

    public Date getTglMulaiKerja() {
        return tglMulaiKerja;
    }

    public void setTglMulaiKerja(Date tglMulaiKerja) {
        this.tglMulaiKerja = tglMulaiKerja;
    }

    public String getJenisKelamin() {
        return jenisKelamin;
    }

    public void setJenisKelamin(String jenisKelamin) {
        this.jenisKelamin = jenisKelamin;
    }

    public Short getSisaCuti() {
        return sisaCuti;
    }

    public void setSisaCuti(Short sisaCuti) {
        this.sisaCuti = sisaCuti;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Jabatan getIdJabatan() {
        return idJabatan;
    }

    public void setIdJabatan(Jabatan idJabatan) {
        this.idJabatan = idJabatan;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nik != null ? nik.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Karyawan)) {
            return false;
        }
        Karyawan other = (Karyawan) object;
        if ((this.nik == null && other.nik != null) || (this.nik != null && !this.nik.equals(other.nik))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Karyawan[ nik=" + nik + " ]";
    }

    public void setSisa(short parseShort) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean getSisa() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

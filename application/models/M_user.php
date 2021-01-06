<?php

class M_user extends CI_Model
{
    public function getUser($id = null)
    {
        if ($id === null) {
            return $this->db->get('tb_user')->result_array();
        } else {
            $this->db->where('id_user', $id);
            return $this->db->get('tb_user')->result_array();
        }
    }
    public function createUser()
    {
        date_default_timezone_set("Asia/Makassar");
        $data = [
            'username' => $this->input->post('username'),
            'password' => md5($this->input->post('password')),
            'email' => $this->input->post('email'),
            'number' => $this->input->post('number'),
            'gender' => $this->input->post('gender'),
            'photo' => 'Profil.png',
        ];
        $this->db->insert('tb_user', $data);
        $user_id = $this->db->insert_id();
        $key_data = [
            'user_id' => $user_id,
            'key' => base64_encode($this->input->post('password')),
            'level' => 2,
            'ignore_limits' => 0,
            'is_private_key' => 0,
            'date_created' => strtotime(date("Y-m-d H:i:s"))
        ];
        $this->db->insert('keys', $key_data);
        return $this->db->affected_rows();
    }

    public function cekUser()
    {
        $this->db->where('username', $this->input->post('username'));
        $this->db->get('tb_user');
        return $this->db->affected_rows();
    }

    public function cekUpdate()
    {
        $this->load->library('upload');
        $id = $this->input->post('id');
        $config['upload_path'] = './assets/image/profil';
        $config['overwrite'] = true;
        $config['allowed_types'] = 'jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF';
        $config['file_name'] = $_FILES['image']['name'];
        $this->upload->initialize($config);
        if (!empty($_FILES['image']['name'])) {
            if ($this->upload->do_upload('image')) {
                $this->upload->data();
                $data = [
                    'photo' => $_FILES['image']['name']
                ];
                $this->db->where('id_user', $id);
                $this->db->update('tb_user', $data);
                return $this->db->affected_rows();
            }
        }
    }
}

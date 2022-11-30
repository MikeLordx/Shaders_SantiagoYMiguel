using UnityEngine;

public class CameraController : MonoBehaviour
{
    [SerializeField] private float _mouseSensitivityX = default;
    [SerializeField] private float _mouseSensitivityY = default;
    [SerializeField] private Transform _player = default;
    [SerializeField] private Transform _target = default;
    private float _xRotation = 0.0f;

    private void Start()
    {
        transform.LookAt(_target);
    }

    private void Update()
    {
        float mouseX = Input.GetAxis("Mouse X") * _mouseSensitivityX * Time.deltaTime;
        float mouseY = Input.GetAxis("Mouse Y") * _mouseSensitivityY * Time.deltaTime;

        _xRotation -= mouseY;
        _xRotation = Mathf.Clamp(_xRotation, -90f, 90f);
        transform.localRotation = Quaternion.Euler(_xRotation, 0f, 0f);
        _player.Rotate(Vector3.up * mouseX);
    }
}
